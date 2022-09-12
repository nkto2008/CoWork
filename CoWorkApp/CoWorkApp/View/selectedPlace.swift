//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct selectedPlace: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    var place : RentResponse
    
    init(place: RentResponse) {
        self.place = place
    }
    

    
    // Need to add NavigationStackCompact in ContentView
    var body: some View {
        ZStack{
            
            Color("BgColor").edgesIgnoringSafeArea(.all)
            // Need to avoid Divider because a Stack can only contains 10
            VStack (alignment: .leading) {
                Button {
                    DispatchQueue.main.async {
                        self.navigationStack.pop(to: PopDestination.previous)
                    }
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(Color.black)
                    Text("Back")
                        .font(.body)
                        .foregroundColor(Color.black)
                }
                VStack (alignment: .center){
                    Text(place.place.name)
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    
                    ScrollView {
                        VStack{
                            ForEach(place.schedules) { schedule in
                                HStack {
                                Text("\(schedule.day) \n \(schedule.time)")
                                        .padding(10)
                                }
                            }
                        }
                    }
                    .padding()
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    }
            }
            Spacer()
        }
    }
}
