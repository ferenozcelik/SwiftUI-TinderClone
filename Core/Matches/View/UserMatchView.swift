//
//  UserMatchView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 20.03.2024.
//

import SwiftUI

struct UserMatchView: View {
    
    @Binding var show: Bool
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            
            VStack(spacing: 120) {
                VStack {
                    Image(.itsamatch)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 100)
                    Text("You and Shakira have liked each other.")
                        .foregroundStyle(.white)
                }
                
                HStack(spacing: 16) {
                    Image(MockData.users.last!.profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                    
                    Image(MockData.users.first!.profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                }
                
                VStack(spacing: 16) {
                    Button("Send Message") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(Capsule())
                    
                    Button("Keep Swiping") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.clear)
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .stroke(.white, lineWidth: 1)
                            .shadow(radius: 4)
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
}
