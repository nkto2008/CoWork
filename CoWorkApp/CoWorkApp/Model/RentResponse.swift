//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class RentResponse: CustomStringConvertible, Identifiable {
    
    var description: String {
        "Api default response"
    }
  
    let place : PlaceResponse
    let schedules : [ScheduleResponse]
    
    public init(place: PlaceResponse, schedules: [ScheduleResponse]){
        self.place = place
        self.schedules = schedules
    }
    
    public class func fromDict(_ array: [String: Any]) -> RentResponse? {
        
        guard let place = array["place"] as? [String: Any],
              let schedules = array["schedules"] as? [[String: Any]],
              let placeResponse = PlaceResponse.fromDict(place) else {
            print("Coucou")
            return nil
        }
        
        let schedulesResponse = schedules.compactMap(ScheduleResponse.fromDict(_:))
       
        return RentResponse(place: placeResponse, schedules: schedulesResponse)
    }
}
