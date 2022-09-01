//
//  UserSignUpService.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI


class SignUpUser {
    class func SignUp(_ firstname: String, _ lastname: String, _ email: String, _ password: String, _ pseudo: String, _ phone: String, completion: @escaping (ApiResponse) -> Void){
        guard let url = URL(string: ApiService.URL + "/signUp") else {
            completion(ApiResponse(error: true, message: "Cannot access URL"))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataArray = ["firstname": firstname, "phonenumber": phone, "lastname": lastname, "pseudo": pseudo, "email": email, "password": password]
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
                completion(ApiResponse(error: true, message: "Error while serializing response"))
                return
            }
            
            completion(ApiResponse(error: false, message: message))
            
        }
        req.resume()
    }
}
