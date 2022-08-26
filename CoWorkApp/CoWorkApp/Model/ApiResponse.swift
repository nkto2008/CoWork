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
    let data: [Any]
    
    public init(error: Bool, message: String, data: [Any]){
        self.error = error
        self.message = message
        self.data = data
    }
    
    public class func fromDict(_ array: [String: Any]) -> ApiResponse? {
        guard let error = array["error"] as? Bool,
              let message = array["message"] as? String,
              let data = array["data"] as? [Any] else {
            return nil
        }
        
        return ApiResponse(error: error, message: message, data: data)
    }
}
