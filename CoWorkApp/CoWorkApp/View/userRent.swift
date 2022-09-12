//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI

struct userRent: View {
    let places = ApiService.PLACE
    var body: some View {
        ZStack(alignment: .center){
            VStack {
                ForEach(places) { place in
                    HStack {
                        Button {
                            //DispatchQueue.main.async {
                              //  self.navigationStack.push(signUp())
                            //}
                            print("Hello" + place.place.id)
                        } label: {
                            Text(place.place.name)
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

