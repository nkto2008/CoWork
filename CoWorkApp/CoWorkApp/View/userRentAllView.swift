//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct userRentAllView: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    let userRents = ApiService.USER_RENT
    
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
                    Text("My Rent")
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    ScrollView (SwiftUI.Axis.Set.vertical){
                        ForEach(userRents){ rent in
                            ForEach(rent.userRent){ ids in
                                Divider()
                                    .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                                    .background(Color.black)
                                    .padding(1)
                                VStack {
                                    Text("\(ids.name) \n \(ids.time) \n \(ids.day)")
                                    Button {
                                        UserCancelRentService.Cancel(idPlace: ids.placeId, idSchedule: ids.scheduleId) { res in
                                            if(res.error){
                                                print(res.message)
                                            } else {
                                                
                                                DispatchQueue.main.async {
                                                    self.navigationStack.pop()
                                                }
                                            }
                                        }
                                        
                                    } label: {
                                            Text("Annuler ma réservation")
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
