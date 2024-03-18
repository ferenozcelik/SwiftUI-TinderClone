//
//  CardView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 13.03.2024.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var vm: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    
    let card: Card
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlayView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
                    .frame(width: SizeConstants.cardWidth)
            }
            
            UserInfoView(user: user)
        }
        .onReceive(vm.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged(_:))
                .onEnded(onDragEnded(_:))
        )
    }
}

#Preview {
    CardView(vm: CardsViewModel(service: CardService()),
             card: Card(user: MockData.users.last!))
}

private extension CardView {
    
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
    
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            vm.removeCard(card)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            vm.removeCard(card)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        let topCard = vm.cards.last
        if topCard == card {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
    
    var user: User {
        return card.user
    }
    
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}
