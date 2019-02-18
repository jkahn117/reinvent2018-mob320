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
    
    init(hotelId: String) {
        
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
        
//        appSyncClient?.fetch(query:ListHotelsQuery(), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
//
//            guard let r = result, error == nil else {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//            print("\(r.data?.listHotels?.count)")
//
//        }
        
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
        return nil
    }
    
    func confirmation(_ forBooking: [String : Any]) -> String? {
        return nil
    }
    
    func checkin(_ forBooking: [String : Any]) -> String? {
        return nil
    }
    
    func checkout(_ forBooking: [String : Any]) -> String? {
        return nil
    }
    
    func bookingName(_ forBooking: [String : Any]) -> String? {
        return nil
    }
    
    func bookingImageUrl(_ forBooking: [String : Any]) -> String? {
        return nil
    }
    
    
}
