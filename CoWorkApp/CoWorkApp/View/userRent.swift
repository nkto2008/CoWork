//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct userRent: View {
    
    let places = ApiService.PLACE
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    // Add request to get if place is already in rent
    var body: some View {
        ScrollView(Axis.Set.vertical){
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack {
                ForEach(places) { place in
                    HStack {
                        VStack{
                         
                        Button {
                            DispatchQueue.main.async {
                                self.navigationStack.push(selectedPlace(place: place))
                            }
                            print("Hello" + place.place.id)
                        } label: {
                           
                            Text("\(place.place.name) \n \(place.place.city) \n \(place.place.cp) \n ")
                                .foregroundColor(Color.black)
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        .background(.gray)
                        .padding(20)
                        }
                    }
                }
            }
        }
    }
}

