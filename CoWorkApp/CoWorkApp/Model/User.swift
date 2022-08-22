//
//  User.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import Foundation

class User: CustomStringConvertible {
    var description: String {
        "This is a user"
    }
    
    let id: String?
    let firstname: String
    let lastname: String
    let pseudo: String
    let email: String
    let password: String
    let phone: String
    
    init(id: String?, firstname: String, lastname: String, pseudo: String, email: String, password: String, phone: String){
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.pseudo = pseudo
        self.email = email
        self.password = password
        self.phone = phone
    }
    
    // function fromDict
    
}
