//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class Place: CustomStringConvertible {
    var description: String {
        "Place default response"
    }
    
    let error: Bool
    let data: [String : Any]
    
    public init(error: Bool, data: [String : Any]){
        self.error = error
        self.data = data
    }
    
    public class func fromDict(_ array: [[String : Any]]) -> Place? {
        
        guard let error = array[0]["error"] as? Bool,
              let data = array[0]["place"] as? [String : Any] else {
            print("Coucou")
            return nil
        }
        

        return Place(error: error, data: data)
    }
}
