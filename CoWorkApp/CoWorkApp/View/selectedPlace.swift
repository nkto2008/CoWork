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
             
                    Text("\(place.place.name) \n \(place.place.city) \n \(place.place.cp)")
                        .font(.largeTitle)
                        .padding(Edge.Set.bottom, 30)
                        .padding(Edge.Set.top, 10)
                    Divider()
                        .frame(maxWidth: 2000, maxHeight: 0, alignment: .trailing)
                        .background(Color.black)
                        .padding(Edge.Set.bottom, 20)
                    
                    ScrollView {
                        VStack{
                            ForEach(place.schedules) { schedule in
                                HStack {
                                    VStack{
                                        Text("\(schedule.day) \n \(schedule.time)")
                                        if(!schedule.state){
                                        if(schedule.time != "Fermé" && schedule.time != "fermé") { Button {
                                        UserGetRentService.Rent(id_place: schedule.idPlace, id_schedule: schedule.id) { res in
                                            if(res.error) {
                                                print(res.message)
                                            } else {
                                                //Errrrrror ICIIIII
                                                DisplayRentUser.display() { res in
                                                    if(res.isEmpty){
                                                        print("errrrror")
                                                        DispatchQueue.main.async {
                                                            self.navigationStack.push(MainView())
                                                        }
                                                    } else {
                                                        ApiService.PLACE = res
                                                        DispatchQueue.main.async {
                                                            self.navigationStack.pop()
                                                        }
                                                    }
                                                    
                                                }
                                            }
                                        }
                                    } label: {
                                       
                                        Text("Réserver")
                                            .foregroundColor(Color.green)
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                    }
                                    }
                                        } else {
                                            Text("Déjà réservé")
                                        }
                                }
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
