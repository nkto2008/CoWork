//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct signUp: View {
    @State private var firstname : String = ""
    @State private var lastname : String = ""
    @State private var pseudo : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var phone : String = ""
    
    // Need to add NavigationStackCompact in ContentView
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            // Need to avoid Divider because a Stack can only contains 10
            VStack (alignment: .leading) {
                
                VStack (alignment: .center){
                    Text("Sign Up")
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                }
                VStack(alignment: .leading){
                    Text("Fistname")
                    TextField("Your fistname", text: $firstname)
                        .padding(Edge.Set.bottom, 20)
                }
                VStack(alignment: .leading){
                    Text("Lastname")
                    TextField("Your fistname", text: $lastname)
                        .padding(Edge.Set.bottom, 20)
                }
                VStack(alignment: .leading){
                    Text("Email Address")
                    TextField("Your email address", text: $email)
                        .padding(Edge.Set.bottom, 20)
                }
                VStack(alignment: .leading){
                    Text("Password")
                    SecureField("Your password", text: $password)
                        .padding(Edge.Set.bottom, 20)
                }
                VStack(alignment: .leading){
                    Text("Pseudo")
                    TextField("Your fistname", text: $pseudo)
                        .padding(Edge.Set.bottom, 20)
                }
                VStack(alignment: .leading){
                    Text("Phone number")
                    TextField("Your fistname", text: $phone)
                        .padding(Edge.Set.bottom, 20)
                }
                HStack {
                    VStack(alignment: .center){
                        Button {
                            if (firstname != "" && lastname != "" && pseudo != "" && email != "" && password != "" && phone != ""){
                                SignUpUser.SignUp(_: firstname, _: lastname, _: email, _: password, _: pseudo, _: phone) { res in
                                    if(res.error) {
                                        print(res.message)
                                    } else {
                                        print(res.message)
                                        self.navigationStack.push(signIn())
                                    }
                                }
                            } else {
                                print("You must fill all textfields")
                            }
                        } label: {
                            Text("Submit")
                                .foregroundColor(Color.black)
                        }
                        Divider()
                            .frame(maxWidth: 2000, maxHeight: 5, alignment: .trailing)
                            .background(Color.black)
                    }
                }
                VStack(alignment: .center){
                    Button {
                        self.navigationStack.push(signIn())
                    } label: {
                        Text("Already sign up click here ! ")
                            .foregroundColor(Color.black)
                    }
                }
                .padding(Edge.Set.leading, 0)
                .padding()
            }
            .padding()
        }
    }
}
