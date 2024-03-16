//
//  CardService.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 16.03.2024.
//

import Foundation

struct CardService {
    
    func fetchCards() async throws -> [Card] {
        let users = MockData.users
        return users.map { user in
            Card(user: user)
        }
    }
}
