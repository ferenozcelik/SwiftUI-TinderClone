//
//  MainTabBarView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 13.03.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Swipe")
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            Text("Inbox")
                .tabItem { Image(systemName: "bubble") }
                .tag(2)
            
            Text("Profile")
                .tabItem { Image(systemName: "person") }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
