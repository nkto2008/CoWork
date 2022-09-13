//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class ScheduleResponse: CustomStringConvertible, Identifiable {
    var description: String {
        "Api default response"
    }
    
    let id: String
    let day: String
    let idPlace: String
    let time: String
    let state: Bool
    
    public init(id: String, day: String, idPlace: String, time: String, state: Bool){
        self.id = id
        self.day = day
        self.idPlace = idPlace
        self.time = time
        self.state = state
    }
    
    public class func fromDict(_ array: [String: Any]) -> ScheduleResponse? {
        
        guard let id = array["_id"] as? String,
              let day = array["day"] as? String,
              let state = array["rent"] as? Bool,
              let idPlace = array["idPlace"] as? String,
              let time = array["time"] as? String else {
            print("Coucou")
            return nil
        }
        

        return ScheduleResponse(id: id, day: day, idPlace: idPlace, time: time, state: state)
    }
}
