//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct subPage: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    let subPage = ApiService.SUBLIST
    
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
                    Text("Welcome to sub page")
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                    Button {
                        
                        print(subPage)
                    } label: {
                            Text("Je souhaite m'abonner !")
                            .foregroundColor(Color.red)
                    }
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    ScrollView (SwiftUI.Axis.Set.vertical){
                            ForEach(subPage){ sub in
                                ForEach(sub.sub){ availableSub in
                                    Divider()
                                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                                        .background(Color.black)
                                        .padding(1)
                                    VStack {
                                        Text("\(availableSub.name) \n \(availableSub.price) \n")
                                        Button {
                                       
                                        
                                        } label: {
                                                Text("Je souhaite m'abonner !")
                                                .foregroundColor(Color.red)
                                        }
                                    }
                                    .padding(10)
                                }
                            }
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
