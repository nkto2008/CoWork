//
//  UserSignUpService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI


class DisplayRentUser {
    class func display(completion: @escaping ([RentResponse]) -> Void){
        guard let url = URL(string: ApiService.URL + "/getPlace") else {
            completion([])
            return 
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(ApiService.TOKEN, forHTTPHeaderField: "authorization")
        
        let req = URLSession.shared.dataTask(with: urlRequest) { (datas, res, err)  in
            guard err == nil, let d = datas else {
                completion([])
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: d,options: .allowFragments)
            
            guard let apiResponseArray = json as? [[String: Any]] else {
                completion([])
                return
            }
            
           
            
            completion(apiResponseArray.compactMap(RentResponse.fromDict(_:)))
            
        }
        req.resume()
    }
}
