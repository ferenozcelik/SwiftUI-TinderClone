//
//  User.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 16.03.2024.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageURLs: [String]
    
}
