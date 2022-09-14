//
//  UserSignUpService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI


class UserCancelRentService {
    class func Cancel(idPlace: String, idSchedule: String, completion: @escaping (ApiResponse) -> Void){
        guard let url = URL(string: ApiService.URL + "/cancelRent") else {
            completion(ApiResponse(error: true, message: "Error during process"))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(ApiService.TOKEN, forHTTPHeaderField: "Authorization")
        
        var dataArray: [String: Any] = [:]
        
        dataArray["fk_user"] = ApiService.USER!.id
        dataArray["fk_place"] = idPlace
        dataArray["fk_pls"] = idSchedule
        
      
        let datas = try? JSONSerialization.data(withJSONObject: dataArray, options: .fragmentsAllowed)
        urlRequest.httpBody = datas

        let req = URLSession.shared.dataTask(with: urlRequest) { (datas, res, err)  in
            guard err == nil, let _ = datas else {
                completion(ApiResponse(error: true, message: "Error during process"))
                return
            }
        
            completion(ApiResponse(error: false, message: "Ok"))
            
        }
        req.resume()
    }
}
