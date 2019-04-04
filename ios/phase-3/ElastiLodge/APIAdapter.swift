//
//  APIAdapter.swift
//  ElastiLodge
//
//  Created by Stormacq, Sebastien on 18/11/2018.
//  Copyright © 2018 Stormacq, Sebastien. All rights reserved.
//

import Foundation

protocol ElastiLodgeAPI {
    var lodgeLogoUrl : String? { get }
    var name : String? { get }
    var location : String? { get }
    var category : Int? { get }
    var address : [String?] { get }
    var coordinate : String? { get }
    var phone : String? { get }
    var amenities : String? { get }
    func restaurant(_ atIndex : Int) -> [String]? // [restaurant, description]
    func bookings(_ forIdentity : String) -> [[String:Any]]?
    func confirmation(_ forBooking: [String:Any]) -> String?
    func checkin(_ forBooking: [String:Any]) -> String?
    func checkout(_ forBooking: [String:Any]) -> String?
    func bookingName(_ forBooking: [String:Any]) -> String?
    func bookingImageUrl(_ forBooking: [String:Any]) -> String?
    var rate : Int? { get }
    var rateCurrency : String? { get }
}

class APIAdapter : NSObject, ElastiLodgeAPI {
    
    //let api = LegacyAPI(hotelId: "3")
    let api = GraphQLAPI(hotelId: "3", userId: "1")
    
    var lodgeLogoUrl : String? {
        return api.lodgeLogoUrl
    }
    var name : String? {
        return api.name
    }
    var location : String? {
        return api.location
    }
    var category : Int? {
        return api.category
    }
    var address : [String?] {
        return api.address
    }
    var coordinate : String? {
        return api.coordinate
    }
    var phone : String? {
        return api.phone
    }
    var amenities : String? {
        return api.amenities
    }
    func restaurant(_ atIndex : Int) -> [String]? {
        return api.restaurant(atIndex)
    }
    func bookings(_ forIdentity : String) -> [[String:Any]]? {
        return api.bookings(forIdentity)
    }
    func confirmation(_ forBooking: [String:Any]) -> String? {
        return api.confirmation(forBooking)
    }
    func checkin(_ forBooking: [String:Any]) -> String? {
        return api.checkin(forBooking)
    }
    func checkout(_ forBooking: [String:Any]) -> String? {
        return api.checkout(forBooking)
    }
    func bookingName(_ forBooking: [String:Any]) -> String? {
        return api.bookingName(forBooking)
    }
    func bookingImageUrl(_ forBooking: [String:Any]) -> String? {
        return api.bookingImageUrl(forBooking)
    }
    var rate : Int? {
        return api.rate
    }
    var rateCurrency : String? {
        return api.rateCurrency
    }
}
