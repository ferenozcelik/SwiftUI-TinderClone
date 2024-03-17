//
//  Card.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 16.03.2024.
//

import Foundation

struct Card {
    let user: User
}

extension Card: Identifiable, Hashable {
    var id: String {
        return user.id
    }
}
