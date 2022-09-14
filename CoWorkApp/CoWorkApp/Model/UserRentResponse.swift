//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class UserRentResponse: CustomStringConvertible, Identifiable {
    var description: String {
        "Api default response"
    }
    
    let userRent: [UserRent]
    
    public init(userRent: [UserRent]){
        self.userRent = userRent
    }
    
    public class func fromDict(_ array: [String: Any]) -> UserRentResponse? {
        
        guard let userRent = array["rent"] as? [[String: Any]] else {
            return nil
        }
        
        let UserRentResponseArray = userRent.compactMap(UserRent.fromDict(_:))
        
        return UserRentResponse(userRent: UserRentResponseArray)
    }
}
