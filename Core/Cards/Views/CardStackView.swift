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
        ZStack {
            ForEach(vm.cards) { card in
                CardView(vm: vm, card: card)
            }
        }
    }
}

#Preview {
    CardStackView()
}
