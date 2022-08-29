//
//  signIn.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct signIn: View {
    @State private var email : String = ""
    @State private var password : String = ""
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading){
                Text("Auth")
                    .font(.largeTitle)
                    .padding(Edge.Set.bottom, 30)
                Text("Email Address")
                TextField("Your email address", text: $email)
                Divider()
                    .frame(height: 5)
                    .background(Color.black)
                    .padding(Edge.Set.bottom, 30)
                Text("Password")
                SecureField("Your password", text: $password)
                Divider()
                    .frame(height: 5)
                    .background(Color.black)
                    .padding(Edge.Set.bottom, 50)
                HStack {
                    VStack(alignment: .trailing){
                        Button {
                            if(email != "" && password != ""){
                                SignInUser.SignIn(_: email, _: password) { res in
                                    if(res.error) {
                                        print(res.message)
                                    } else {
                                        ApiService.TOKEN = res.message
                                        userProfileService.getUserProfile(_: ApiService.TOKEN) { res in
                                            if(res.error) {
                                                print("Error dude")
                                            } else {
                                                let user = User(id: res.id, firstname: res.firstname, lastname: res.lastname, pseudo: res.pseudo, email: res.email, phone: res.phone, error: false)
                                                ApiService.USER = user
                                                DispatchQueue.main.async {
                                                    self.navigationStack.push(MainView())
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                print("You must fill all fields")
                            }
                        } label: {
                            Text("Login")
                                .foregroundColor(Color.black)
                        }
                        Divider()
                            .frame(maxWidth: 50, maxHeight: 5, alignment: .trailing)
                            .background(Color.black)
                    }
                    .padding(30)
                    VStack(alignment: .trailing){
                        Button {
                            DispatchQueue.main.async {
                                self.navigationStack.push(signUp())
                            }
                        } label: {
                            Text("Sign Up ?")
                                .foregroundColor(Color.black)
                        }
                        Divider()
                            .frame(maxWidth: 70, maxHeight: 5, alignment: .trailing)
                            .background(Color.black)
                    }
                }
            }
            .padding(Edge.Set.leading, 0)
            .padding()
        }
        .padding()
    }
}

