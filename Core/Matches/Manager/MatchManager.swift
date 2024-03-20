//
//  MatchManager.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 20.03.2024.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user: User) {
        let didMatch = Bool.random()
        
        if didMatch {
            matchedUser = user
        }
    }
}
