//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 19.03.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                CurrentUserProfileHeaderView(user: user)
                
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullname)
                    }
                    HStack {
                        Text("Age")
                        Spacer()
                        Text("\(user.age)")
                    }
                }
                
                Section("Legal") {
                    Text("Terms of Service")
                }
                
                Section() {
                    Button("Logout") { }
                    Button("Delete Account") { }
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users.last!)
}
