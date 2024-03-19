//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 19.03.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State private var showEditProfile: Bool = false
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                
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
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users.last!)
}
