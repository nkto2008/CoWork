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
    
    let v: String
    let id: String
    let city: String
    let cp: String
    let name: String
    
    public init(v: String, id: String, city: String, cp: String, name: String){
        self.v = v
        self.id = id
        self.city = city
        self.cp = cp
        self.name = name
    }
    
    public class func fromDict(_ array: [String: Any]) -> PlaceResponse? {
        
        guard let v = array["v"] as? String,
              let id = array["id"] as? String,
              let city = array["city"] as? String,
              let cp = array["cp"] as? String,
              let name = array["name"] as? String else {
            print("Coucou")
            return nil
        }
        

        return PlaceResponse(v: v, id: id, city: city, cp: cp, name: name)
    }
}
