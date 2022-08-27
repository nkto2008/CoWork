//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct homePage: View {
    
    // Need to add NavigationStackCompact in ContentView
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    var body: some View {
        TabView {
            //profil
            userProfile()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            //réserver
            userRent()
                .tabItem {
                    Label("Réserver", systemImage: "bag")
                }
            //déconnexion
            logout()
                .tabItem {
                    Label("Logout", systemImage: "figure.walk")
                }
        }
    }
}
