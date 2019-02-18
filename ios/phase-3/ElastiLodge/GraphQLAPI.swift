//
//  GraphQLAPI.swift
//  ElastiLodge
//
//  Created by Stormacq, Sebastien on 20/11/2018.
//  Copyright © 2018 Stormacq, Sebastien. All rights reserved.
//

import Foundation
import UIKit
import AWSAppSync

class GraphQLAPI : ElastiLodgeAPI {
    
    private var appSyncClient: AWSAppSyncClient?
    private var hotelDetails : GetHotelQuery.Data.GetHotel?
    private var bookingDetails: [GuestReservationsQuery.Data.GuestReservation?]?
    private var newReservationSubscription : Cancellable?
    
    init(hotelId: String, userId: String) {
        
        do {
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()
            let appSyncServiceConfig = try AWSAppSyncServiceConfig()
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: appSyncServiceConfig,
                                                                  cacheConfiguration: cacheConfiguration)
            
            //AppSync configuration & client initialization
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            
            // Set id as the cache key for objects. See architecture section for details
            appSyncClient?.apolloClient?.cacheKeyForObject = { $0["_id"] }
        } catch {
            fatalError("Error initializing appsync client. \(error)")
        }
        
        // fetch hotel data
        appSyncClient?.fetch(query:GetHotelQuery(hotelId: hotelId), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
            guard let r = result, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            // save the hotel details
            self.hotelDetails = r.data?.getHotel
            
            print("GraphQLAPI : Notifying our subscribers, data are available")
            DispatchQueue.main.async {
                let app = UIApplication.shared.delegate as! AppDelegate
                NotificationCenter.default.post(name: app.dataAvailableNotificationName, object: r)
            }
        }
        
        // fetch reservation data
        appSyncClient?.fetch(query:GuestReservationsQuery(guestId: userId), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
            guard let r = result, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            // save the hotel details
            self.bookingDetails = r.data?.guestReservations
            
            // do not notify as customer will land on booking page after the main page
            // not nice, but this is just a demo
        }
        
        // register to be notified on reservation change (mutation subscription)
        do {
            print("Subscribing to Create Reservation Event")
            let sub = CreateReservationEventSubscription(guestId: userId)
            newReservationSubscription = try appSyncClient?.subscribe(subscription: sub, resultHandler: { (result, transaction, error) in
                guard let r = result, error == nil else {
                    if let e = error?.localizedDescription {
                        if ((e.hasSuffix("missingValue"))) {
                            print(e)
                            print("Whoever called the mutation did not ask for all fields in the response")
                        }
                    }
                    return
                }
                print("valid create reservation notification received")
                // store reference to the new booking
                if let nb = r.data?.createReservationEvent {
                    let address = GuestReservationsQuery.Data.GuestReservation.Hotel.Address(street: nb.hotel.address.street, city: nb.hotel.address.country, country:nb.hotel.address.country, zip: nb.hotel.address.zip)
                    var hotel = GuestReservationsQuery.Data.GuestReservation.Hotel(hotelId: nb.hotel.hotelId, name: nb.hotel.name, location: nb.hotel.location, address: address, phoneNumber: nb.hotel.phoneNumber, category: nb.hotel.category)
                    hotel.image = nb.hotel.image
                    let bookingToAdd = GuestReservationsQuery.Data.GuestReservation(confirmationNumber: nb.confirmationNumber, hotel: hotel, guestId: nb.guestId, startDate: nb.startDate, endDate: nb.endDate, rate: nb.rate)
//                    do {
//                        // Update the local store with the newly received data
//                        try transaction?.update(query: GuestReservationsQuery(guestId: userId)) { (data: inout GuestReservationsQuery.Data) in
//
//                            data.guestReservations?.append(bookingToAdd)
                            self.bookingDetails?.append(bookingToAdd)

                            // notify observer new data are available
                            DispatchQueue.main.async {
                                print("notifying our listeners")
                                let app = UIApplication.shared.delegate as! AppDelegate
                                NotificationCenter.default.post(name: app.mutationAvailableNotificationName, object: self.bookingDetails)
                            }
//                        }
//                    } catch {
//                        print("Error updating store")
//                    }
                }
            })
        } catch {
            print("Error starting subscription.")
        }

    }
    
    deinit {
        print("Cancelling subscription..")
        newReservationSubscription?.cancel()
    }
    
    var lodgeLogoUrl: String? {
        return hotelDetails?.image
    }
    
    var name: String? {
        return hotelDetails?.name
    }

    var location: String? {
        return hotelDetails?.location
    }

    var category: Int? {
        return hotelDetails?.category
    }

    var address: [String?] {
        return [ hotelDetails?.address.street,
                 hotelDetails?.address.zip,
                 hotelDetails?.address.city,
                 hotelDetails?.address.country]
    }
    
    var coordinate: String? {
        return nil
    }
    
    var phone: String? {
        return hotelDetails?.phoneNumber
    }
    
    var amenities: String? {
        return hotelDetails?.amenities?.compactMap({ $0 }).joined(separator: "\n")

    }
    
    func restaurant(_ atIndex: Int) -> [String]? {
        return nil
    }
    
    func bookings(_ forIdentity: String) -> [[String : Any]]? {
        
        guard let bd = bookingDetails else {
            print("no booking details yet")
            return nil
        }
        var result = [[String:Any]]()
        for b in bd {
            result.append(["booking" : b as Any])
        }
        return result
    }
    
    func confirmation(_ forBooking: [String : Any]) -> String? {
        if let b = forBooking["booking"] as? GuestReservationsQuery.Data.GuestReservation {
            return b.confirmationNumber
        } else {
            fatalError("Can not read confirmation number")
        }
    }
    
    func checkin(_ forBooking: [String : Any]) -> String? {
        if let b = forBooking["booking"] as? GuestReservationsQuery.Data.GuestReservation {
            return b.startDate
        } else {
            fatalError("Can not read start date")
        }
    }
    
    func checkout(_ forBooking: [String : Any]) -> String? {
        if let b = forBooking["booking"] as? GuestReservationsQuery.Data.GuestReservation {
            return b.endDate
        } else {
            fatalError("Can not read end date")
        }
    }
    
    func bookingName(_ forBooking: [String : Any]) -> String? {
        if let b = forBooking["booking"] as? GuestReservationsQuery.Data.GuestReservation {
            return b.hotel.name
        } else {
            fatalError("Can not read hotel name")
        }
    }
    
    func bookingImageUrl(_ forBooking: [String : Any]) -> String? {
        if let b = forBooking["booking"] as? GuestReservationsQuery.Data.GuestReservation {
            return b.hotel.image
        } else {
            fatalError("Can not read hotel name")
        }
    }
    var rate : Int? {
        return hotelDetails?.rate?.rate
    }
    var rateCurrency : String? {
        return hotelDetails?.rate?.currency
    }
}
