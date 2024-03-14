//
//  CardView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 13.03.2024.
//

import SwiftUI

struct CardView: View {
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(.shakira1)
                    .resizable()
                    .scaledToFill()
                
                SwipeActionIndicatorView(xOffset: $xOffset)
                    .frame(width: SizeConstants.cardWidth)
            }
            
            UserInfoView()
                .frame(width: SizeConstants.cardWidth)
        }
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
    CardView()
}

private extension CardView {
    
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            xOffset = 0
            degrees = 0
        }
    }
}
