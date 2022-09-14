//
//  User.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import Foundation

class Sub: CustomStringConvertible, Identifiable {
    var description: String {
        "This is a user"
    }
    
    let id: String?
    let name: String
    let price: String
    let fk_service: String
    
    public init(id: String?, name: String, price: String, fk_service: String){
        self.id = id
        self.name = name
        self.price = price
        self.fk_service = fk_service
    }
    
    public class func fromDict(_ array: [String: Any]) -> Sub? {
        guard let id = array["id"] as? String,
              let name = array["name"] as? String,
              let price = array["price"] as? String,
              let fk_service = array["fk_service"] as? String else {
            return nil
        }
        
        return Sub(id: id, name: name, price: price, fk_service: fk_service )
    }
    
}
