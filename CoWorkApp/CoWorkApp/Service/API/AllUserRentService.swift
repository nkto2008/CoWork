//
//  UserSignUpService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI


class AllUserRentService {
    class func Show(completion: @escaping ([UserRentResponse]) -> Void){
        guard let url = URL(string: ApiService.URL + "/getRentByIdUSer") else {
            completion([])
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(ApiService.TOKEN, forHTTPHeaderField: "Authorization")
        
        var dataArray:[String:Any] = [:]
        
        dataArray["id"] = ApiService.USER!.id
    
        
        let datas = try? JSONSerialization.data(withJSONObject: dataArray, options: .fragmentsAllowed)
        urlRequest.httpBody = datas

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
        
            completion(apiResponseArray.compactMap(UserRentResponse.fromDict(_:)))
            
        }
        req.resume()
    }
}
