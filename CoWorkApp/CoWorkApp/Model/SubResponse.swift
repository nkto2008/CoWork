//
//  ApiResponse.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 25/08/2022.
//

import SwiftUI

class SubResponse: CustomStringConvertible, Identifiable {
    var description: String {
        "Api default response"
    }
    
    let sub: [Sub]
    
    public init(sub: [Sub]){
        self.sub = sub
    }
    
    public class func fromDict(_ array: [String: Any]) -> SubResponse? {
        
        guard let subOnly = array["sub"] as? [[String: Any]] else {
            return nil
        }
        
        let subR = subOnly.compactMap(Sub.fromDict(_:))
        
        return SubResponse(sub: subR)
    }
}
