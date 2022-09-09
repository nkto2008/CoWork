//
//  UserSignUpService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI


class UserProfileUpdateService {
    class func Update(_ firstname: String, _ lastname: String, _ email: String, _ pseudo: String, _ phone: String, completion: @escaping (ApiResponse) -> Void){
        guard let url = URL(string: ApiService.URL + "/updateProfile") else {
            completion(ApiResponse(error: true, message: "Cannot access URL"))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(ApiService.TOKEN, forHTTPHeaderField: "Authorization")
        var dataArray:[String:Any] = [:]
        
        if(firstname != "") {
            dataArray["firstname"] = firstname
        }
        if(lastname != "") {
            dataArray["lastname"] = lastname
        }
        if(email != "") {
            dataArray["email"] = email
        }
        if(pseudo != "") {
            dataArray["pseudo"] = pseudo
        }
        if(phone != "") {
            dataArray["phonenumber"] = phone
        }
        
        print(", JSOn")
        
        //let dataArray = ["firstname": firstname, "phonenumber": phone, "lastname": lastname, "pseudo": pseudo, "email": email, "password": password]
        let datas = try? JSONSerialization.data(withJSONObject: dataArray, options: .fragmentsAllowed)
        urlRequest.httpBody = datas
        
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
                completion(ApiResponse(error: true, message: "Error while serializing response 2"))
                return
            }
            
            completion(ApiResponse(error: false, message: message))
            
        }
        req.resume()
    }
}
