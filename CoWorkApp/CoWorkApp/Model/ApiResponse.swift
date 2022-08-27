//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class ApiResponse: CustomStringConvertible {
    var description: String {
        "Api default response"
    }
    
    let error: Bool
    let message: String
    
    public init(error: Bool, message: String){
        self.error = error
        self.message = message
    }
    
    public class func fromDict(_ array: [String: Any]) -> ApiResponse? {
        
        guard let error = array["error"] as? Bool,
              let message = array["message"] as? String else {
            print("Coucou")
            return nil
        }
        

        return ApiResponse(error: error, message: message)
    }
}
