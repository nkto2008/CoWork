//
//  UserSignInService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 27/08/2022.
//

import SwiftUI


class userProfileService {
    class func getUserProfile(_ token: String, completion: @escaping (User) -> Void){
        guard let url = URL(string: ApiService.URL + "/getProfile") else {
            completion(User(id: "", firstname: "", lastname: "", pseudo: "", email: "", phone: "", error: true))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(token, forHTTPHeaderField: "authorization")
        
        let req = URLSession.shared.dataTask(with: urlRequest) { (datas, res, err)  in
            guard err == nil, let d = datas else {
                completion(User(id: "", firstname: "", lastname: "", pseudo: "", email: "", phone: "", error: true))
                print("Error during process")
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: d,options: .allowFragments)
            
            
            guard let apiResponseArray = json as? [String : Any] else {
                completion(User(id: "", firstname: "", lastname: "", pseudo: "", email: "", phone: "", error: true))
                print("Error during serializing")
                return
            }
            print(apiResponseArray)
            
            guard let id = apiResponseArray["id"] as? String,
                  let firstname = apiResponseArray["firstname"] as? String,
                  let lastanme = apiResponseArray["lastname"] as? String,
                  let pseudo = apiResponseArray["pseudo"] as? String,
                  let email = apiResponseArray["email"] as? String,
                  let phone = apiResponseArray["phone"] as? String else {
                completion(User(id: "", firstname: "", lastname: "", pseudo: "", email: "", phone: "", error: true))
                return
            }
            
            completion(User(id: id, firstname: firstname, lastname: lastanme, pseudo: pseudo, email: email, phone: phone, error: false))
            
        }
        req.resume()
    }
}
