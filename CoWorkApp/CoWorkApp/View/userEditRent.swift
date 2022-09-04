//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct userEditRent: View {


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
                Text("My rent")
                    .font(.largeTitle)
                    .padding(Edge.Set.bottom, 30)
                Divider()
                    .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                    .background(Color.black)
                    .padding(Edge.Set.bottom, 20)
                
                VStack {
               
                 
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
