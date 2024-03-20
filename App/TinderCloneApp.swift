//
//  TinderCloneApp.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 13.03.2024.
//

import SwiftUI

@main
struct TinderCloneApp: App {
    @StateObject var matchManager = MatchManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}
