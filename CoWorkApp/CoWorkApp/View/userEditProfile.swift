//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct userEditProfile: View {
    
    @State private var newFirstname : String = ""
    @State private var newLastname : String = ""
    @State private var newPseudo : String = ""
    @State private var newEmail : String = ""
    @State private var newPassword : String = ""
    @State private var newPhone : String = ""
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    // Need to add NavigationStackCompact in ContentView
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            // Need to avoid Divider because a Stack can only contains 10
            VStack (alignment: .leading) {
                Button {
                    DispatchQueue.main.async {
                        self.navigationStack.pop()
                    }
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(Color.black)
                    Text("Back")
                        .font(.body)
                        .foregroundColor(Color.black)
                }
                VStack (alignment: .center){
                    Text("Profile")
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    
                    VStack {
                        HStack {
                            VStack (alignment: .center){
                                Text("Firstname : " + (ApiService.USER?.firstname ?? ""))
                                    .font(.body)
                                TextField("New firstname", text: $newFirstname)
                            }
                        }
                        .padding(.bottom)
                        HStack {
                            VStack (alignment: .center){
                                Text("Lastname : " + (ApiService.USER?.lastname ?? ""))
                                .font(.body)
                                TextField("New lastname", text: $newLastname)
                            }
                        }
                        .padding(.bottom)
                        HStack {
                            VStack (alignment: .center){
                            Text("Pseudo : " + (ApiService.USER?.pseudo ?? ""))
                                .font(.body)
                                TextField("New pseudo", text: $newPseudo)
                            }
                        }
                        .padding(.bottom)
                        HStack {
                            VStack (alignment: .center){
                            Text("Email : " + (ApiService.USER?.email ?? ""))
                                .font(.body)
                                TextField("New email", text: $newEmail)
                            }
                        }
                        .padding(.bottom)
                        HStack {
                            VStack (alignment: .center){
                            Text("Phone number : " + (ApiService.USER?.phone ?? ""))
                                .font(.body)
                                TextField("New phone number", text: $newPhone)
                            }
                        }
                        .padding(.bottom)
                     
                    }
                    .padding()
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    Button {
                        // Need to send datas to the API
                    } label: {
                        Text("Submit")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(.gray)
                            .cornerRadius(50)
                    }
                }
            }
            .padding()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}
