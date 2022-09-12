//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class PlaceResponse: CustomStringConvertible {
    var description: String {
        "Api default response"
    }
    
    let id: String
    let city: String
    let cp: Int
    let name: String
    
    public init(id: String, city: String, cp: Int, name: String){
        self.id = id
        self.city = city
        self.cp = cp
        self.name = name
    }
    
    public class func fromDict(_ array: [String: Any]) -> PlaceResponse? {
        
        guard let id = array["_id"] as? String,
              let city = array["city"] as? String,
              let cp = array["cp"] as? Int,
              let name = array["name"] as? String else {
            print("Coucou")
            return nil
        }
        

        return PlaceResponse(id: id, city: city, cp: cp, name: name)
    }
}
