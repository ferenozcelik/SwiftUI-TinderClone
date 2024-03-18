//
//  SwipeActionButtonsView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 18.03.2024.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    
    @ObservedObject var vm: CardsViewModel
    
    var body: some View {
        HStack(spacing: 32) {
            Button(action: {
                vm.buttonSwipeAction = .reject
            }, label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(color: .black.opacity(0.3), radius: 4)
                    }
            })
            .frame(width: 48, height: 48)

            Button(action: {
                vm.buttonSwipeAction = .like
            }, label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(.green)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(color: .black.opacity(0.3), radius: 4)
                    }
            })
            .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    SwipeActionButtonsView(vm: CardsViewModel(service: CardService()))
}
