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
                        .padding(Edge.Set.bottom, 20)
                    Button("Sign In", action: {
                        self.navigationStack.push(signIn())
                    }).buttonStyle(LandingButtonStyle(bgColor: .gray))
                    Button("Sign Up", action: {
                        self.navigationStack.push(signUp())
                    }).buttonStyle(LandingButtonStyle(bgColor: .gray))

                    
                }
                
                .padding(20)
                
            }
            .padding()
        }
    }
}
