//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct landingPage: View {
    
    // Need to add NavigationStackCompact in ContentView
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    var body: some View {
        NavigationView{
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            // Need to avoid Divider because a Stack can only contains 10
            VStack (alignment: .leading) {
                
                VStack (alignment: .center){
                    Text("Landing Page")
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 100)
                    Button {
                        DispatchQueue.main.async {
                            self.navigationStack.push(signIn())
                        }
                    } label: {
                        Text("Sign In")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(.gray)
                            .cornerRadius(50)
                    }
                    .padding(Edge.Set.leading, 30)
                    .padding(Edge.Set.trailing, 30)
                    .padding(Edge.Set.top, 30)
                    Button {
                        DispatchQueue.main.async {
                            self.navigationStack.push(signUp())
                        }
                    } label: {
                        Text("Sign Up")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(.gray)
                            .cornerRadius(50)
                    }
                    .padding(30)
                    
                }
                Spacer()
                
                .padding(20)
                
            }
            .padding()
        }
    }
    }
}
