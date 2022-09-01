//
//  UserSignInService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 27/08/2022.
//

import SwiftUI


class LogoutUser {
    class func Logout(_ token: String, completion: @escaping (ApiResponse) -> Void){
        guard let url = URL(string: ApiService.URL + "/logout") else {
            completion(ApiResponse(error: true, message: "Cannot access URL"))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(token, forHTTPHeaderField: "authorization")
        let req = URLSession.shared.dataTask(with: urlRequest) { (datas, res, err)  in
            guard err == nil, let d = datas else {
                completion(ApiResponse(error: true, message: "Error during process"))
                return
            }
            let json = try? JSONSerialization.jsonObject(with: d,options: .allowFragments)
            guard let apiResponseArray = json as? [String : Any] else {
                completion(ApiResponse(error: true, message: "Error while serializing response"))
                return
            }
            print(apiResponseArray)
            guard let message = apiResponseArray["message"] as? String else {
                completion(ApiResponse(error: true, message: "Error before last operation"))
                return
            }
            
            completion(ApiResponse(error: false, message: message))
            
        }
        req.resume()
    }
}
