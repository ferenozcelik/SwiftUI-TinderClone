//
//  CardStackView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 16.03.2024.
//

import SwiftUI

struct CardStackView: View {
    
    @StateObject var vm = CardsViewModel(service: CardService())
    
    var body: some View {
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
    }
}

#Preview {
    CardStackView()
}
