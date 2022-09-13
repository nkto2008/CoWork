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



/*
struct SourceViewer: View {

    var body: some View {
        VStack{
         
      }
    }
    
    let site: String
    @State private var sourceCode = "Loading…"

    var body: some View {
        ScrollView {
            Text(sourceCode)
                .font(.system(.body, design: .monospaced))
        }
        .task {
            guard let url = URL(string: "https://\(site)") else {
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
            } catch {
                sourceCode = "Failed to fetch site."
            }
        }
    }*/

