//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class UserRent: CustomStringConvertible, Identifiable {
    var description: String {
        "Api default response"
    }
    
    let name: String
    let time: String
    let day: String
    let placeId: String
    let scheduleId: String
    let userId: String
    
    public init(name: String, time: String, day: String, placeId: String, scheduleId: String, userId: String){
        self.name = name
        self.time = time
        self.day = day
        self.placeId = placeId
        self.scheduleId = scheduleId
        self.userId = userId
    }
    
    public class func fromDict(_ array: [String: Any]) -> UserRent? {
        
        guard let name = array["name"] as? String,
              let time = array["time"] as? String,
              let day = array["day"] as? String,
              let placeId = array["fk_place"] as? String,
              let scheduleId = array["fk_pls"] as? String,
              let userId = array["fk_user"] as? String else {
            return nil
        }
        
        

        return UserRent(name: name, time: time, day: day, placeId: placeId, scheduleId: scheduleId, userId: userId)
    }
}
