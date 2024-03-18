//
//  MockData.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 16.03.2024.
//

import Foundation

struct MockData {
    
    static let users: [User] = [
        .init(
            id: UUID().uuidString,
            fullname: "Shakira",
            age: 47,
            profileImageURLs: [
                "shakira1",
                "shakira2",
                "shakira3"
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "Billie Eilish",
            age: 22,
            profileImageURLs: [
                "billie1",
                "billie2",
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "Sydney Sweeney",
            age: 26,
            profileImageURLs: [
                "sweeny1",
                "sweeny2",
                "sweeny3"
            ]
        ),
    ]
    
}
