//
//  CardStackView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 16.03.2024.
//

import SwiftUI

struct CardStackView: View {
    
    @StateObject var vm = CardsViewModel(service: CardService())
    @EnvironmentObject var matchManager: MatchManager
    @State private var showMatchView = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(vm.cards) { card in
                            CardView(vm: vm, card: card)
                        }
                    }
                    if !vm.cards.isEmpty {
                        SwipeActionButtonsView(vm: vm)
                    }
                }
                .blur(radius: showMatchView ? 10 : 0)
                
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .onReceive(matchManager.$matchedUser, perform: { user in
                showMatchView = user != nil
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderlogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager())
}
