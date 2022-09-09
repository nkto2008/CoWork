//
//  ContentView.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 19/08/2022.
//

import SwiftUI
import NavigationStack

struct ContentView: View {
    var body: some View {
        NavigationStackView(transitionType: .custom(.move(edge: Edge.trailing))) {
            landingPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
