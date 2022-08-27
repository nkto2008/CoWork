//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI

struct logout: View {
    
    // Need to add NavigationStackCompact in ContentView
    
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            // Need to avoid Divider because a Stack can only contains 10
            VStack (alignment: .leading) {
                
                VStack (alignment: .center){
                    Text("Logout")
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                }
                
            }
            .padding()
        }
    }
}
