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
    
    let v: String
    let id: String
    let day: String
    let idPlace: String
    let time: String
    
    public init(v: String, id: String, day: String, idPlace: String, time: String){
        self.v = v
        self.id = id
        self.day = day
        self.idPlace = idPlace
        self.time = time
    }
    
    public class func fromDict(_ array: [String: Any]) -> ScheduleResponse? {
        
        guard let v = array["v"] as? String,
              let id = array["id"] as? String,
              let day = array["day"] as? String,
              let idPlace = array["idPlace"] as? String,
              let time = array["time"] as? String else {
            print("Coucou")
            return nil
        }
        

        return ScheduleResponse(v: v, id: id, day: day, idPlace: idPlace, time: time)
    }
}
