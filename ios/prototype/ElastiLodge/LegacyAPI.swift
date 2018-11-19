//
//  LegacyAPI.swift
//  ElastiLodge
//
//  Created by Stormacq, Sebastien on 18/11/2018.
//  Copyright © 2018 Stormacq, Sebastien. All rights reserved.
//

import Foundation
import UIKit

class LegacyAPI : ElastiLodgeAPI{
    
    let detailsDataURL = "https://s3.amazonaws.com/alexademo.ninja/demo/awsappsync/elastilodge/legacy-lodge-details.json"
    let bookingDataURL = "https://s3.amazonaws.com/alexademo.ninja/demo/awsappsync/elastilodge/legacy-reservations.json"
    var jsonDetails : [String: Any]?
    var bookingDetails : [[String: Any]]?
    let loadDataDispatchGroup = DispatchGroup()
    
    // load our data set from the web URL above.
    init() {
        
        loadLodgeDetails(detailsUrl: detailsDataURL)
        loadBookingDetails(detailsUrl: bookingDataURL)
        
        loadDataDispatchGroup.notify(queue: .main) {
            // notify listeners data are available (it is recommended to do that on the main UI thread)
            print("Notifying our subscribers, data are available")
            DispatchQueue.main.async {
                let app = UIApplication.shared.delegate as! AppDelegate
                NotificationCenter.default.post(name: app.dataAvailableNotificationName, object: nil)
            }
        }
    }
    
    func loadLodgeDetails(detailsUrl : String) -> Void {
        guard let url = URL(string: detailsUrl) else {return}
        
        loadDataDispatchGroup.enter()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                self.loadDataDispatchGroup.leave()
                return
            }
            
            do {
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print(jsonResponse) //Response result
                guard let jsonData = jsonResponse as? [String: Any] else {
                    fatalError("invalid JSON document") // this is a bug in my setup
                }
                self.jsonDetails = jsonData
                print("Lodge details data received")
                self.loadDataDispatchGroup.leave()
                
            } catch let parsingError {
                fatalError(parsingError.localizedDescription) //this is  a bug in my setup
            }
        }
        task.resume()
    }

    func loadBookingDetails(detailsUrl : String) -> Void {
        guard let url = URL(string: detailsUrl) else {return}
        
        loadDataDispatchGroup.enter()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                self.loadDataDispatchGroup.leave()
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                fatalError("Can not download bookings from \(detailsUrl): status code is \((response as? HTTPURLResponse)?.statusCode ?? 0)") //this is a bug in my setup
            }
            
            print(httpResponse.statusCode)
            do {
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print(jsonResponse) //Response result
                guard let jsonData = jsonResponse as? [[String: Any]] else {
                    fatalError("invalid JSON document") // this is a bug in my setup
                }
                print("Booking details data received")
                self.bookingDetails = jsonData
                self.loadDataDispatchGroup.leave()
                
            } catch let parsingError {
                fatalError(parsingError.localizedDescription) //this is  a bug in my setup
            }
        }
        task.resume()
    }

    
    var lodgeLogoUrl : String? {
        return jsonDetails?["image"] as? String
    }
    var name : String? {
        return jsonDetails?["name"] as? String
    }
    var location : String? {
        return jsonDetails?["location"] as? String
    }
    var category : Int? {
        return jsonDetails?["category"] as? Int
    }
    var address : [String?] {
        let addressObject = jsonDetails?["address"] as? [String: Any]
        let line1 = addressObject?["street"] as? String
        let line2a = addressObject?["zip"] as? String
        let line2b = addressObject?["city"] as? String
        let line3 = addressObject?["country"] as? String
        
        return [line1, line2a, line2b, line3]
    }
    var coordinate : String? {
        return jsonDetails?["coordinate"] as? String
    }
    var phone : String? {
        return jsonDetails?["phoneNumber"] as? String
    }
    var amenities: String? {
        return jsonDetails?["amenities"] as? String
    }
    var photoUrl: [String?] {
        if let u = jsonDetails?["photos"] as? [String?] {
            return u
        } else {
            return []
        }
    }
    func bookings(_ forIdentity : String) -> [[String:Any]]? {
        return bookingDetails
    }
    func confirmation(_ forBooking: [String : Any]) -> String? {
        return forBooking["confirmation"] as? String
    }
    func checkin(_ forBooking: [String : Any]) -> String? {
        return forBooking["checkin"] as? String
    }
    func checkout(_ forBooking: [String : Any]) -> String? {
        return forBooking["checkout"] as? String
    }
    func bookingName(_ forBooking: [String:Any]) -> String? {
        return forBooking["lodgeName"] as? String
    }
    func bookingImageUrl(_ forBooking: [String:Any]) -> String? {
        return forBooking["lodgeImage"] as? String
    }
}
