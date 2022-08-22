//
//  ContentView.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var email : String = ""
    @State private var password : String = ""
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
                            print("Button tapped!")
                        } label: {
                            Text("Login")
                                .foregroundColor(Color.black)
                        }
                        Divider()
                            .frame(maxWidth: 50, maxHeight: 5, alignment: .trailing)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
