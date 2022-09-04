//
//  UserSignUpService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI


class DisplayRentUser {
    class func display(completion: @escaping (Place) -> Void){
        guard let url = URL(string: ApiService.URL + "/getPlace") else {
            completion(Place(error: true, data: []))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(ApiService.TOKEN, forHTTPHeaderField: "authorization")
        
        let req = URLSession.shared.dataTask(with: urlRequest) { (datas, res, err)  in
            guard err == nil, let d = datas else {
                completion(Place(error: true, data: []))
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: d,options: .allowFragments)
            
            guard let apiResponseArray = json as? [Any] else {
                completion(Place(error: true, data: []))
                return
            }
            
            print(apiResponseArray)
            
            completion(Place(error: false, data: apiResponseArray))
            
        }
        req.resume()
    }
}
