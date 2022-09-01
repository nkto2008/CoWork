//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct userProfile: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    // Need to add NavigationStackCompact in ContentView
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            // Need to avoid Divider because a Stack can only contains 10
            VStack (alignment: .leading) {
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
                            Text("Firstname : " + (ApiService.USER?.firstname ?? "X"))
                                .font(.body)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("Lastname : " + (ApiService.USER?.lastname ?? "X"))
                                .font(.body)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("Pseudo : " + (ApiService.USER?.pseudo ?? "X"))
                                .font(.body)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("Email : " + (ApiService.USER?.email ?? "X"))
                                .font(.body)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("Phone number : " + (ApiService.USER?.phone ?? "X"))
                                .font(.body)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("id : " + (ApiService.USER?.id ?? "Pas d'id"))
                                .font(.body)
                        }
                        .padding(.bottom)
                    }
                    .padding()
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    Button {
                        DispatchQueue.main.async {
                            self.navigationStack.push(userEditProfile())
                        }
                    } label: {
                        Text("Edit my profile")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(.gray)
                            .cornerRadius(50)
                    }
                    .padding(30)
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
