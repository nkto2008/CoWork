//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class ScheduleResponse: CustomStringConvertible {
    var description: String {
        "Api default response"
    }
    
    let id: String
    let day: String
    let idPlace: String
    let time: String
    
    public init(id: String, day: String, idPlace: String, time: String){
        self.id = id
        self.day = day
        self.idPlace = idPlace
        self.time = time
    }
    
    public class func fromDict(_ array: [String: Any]) -> ScheduleResponse? {
        
        guard let id = array["_id"] as? String,
              let day = array["day"] as? String,
              let idPlace = array["idPlace"] as? String,
              let time = array["time"] as? String else {
            print("Coucou")
            return nil
        }
        

        return ScheduleResponse(id: id, day: day, idPlace: idPlace, time: time)
    }
}
