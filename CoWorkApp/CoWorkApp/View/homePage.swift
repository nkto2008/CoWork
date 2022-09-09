//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI
import NavigationStack

struct MainView: View {
    
    // Need to add NavigationStackCompact in ContentView
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }
    
    var body: some View {
        TabView {
            //profil
            userProfile()
                .tabItem {
                    Label("Profile", systemImage: "person")
                        .padding(.top)
                }
            
            //réserver
            userRent()
                .tabItem {
                    Label("Réserver", systemImage: "bag")
                        .padding(.top)
                }
            
            //déconnexion
            logout()
                .tabItem {
                    Label("Logout", systemImage: "figure.walk")
                        .padding(.top)
                    
                }
            
        }
    }
}
