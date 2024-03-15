//
//  ImageScrollingOverlayView.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 15.03.2024.
//

import SwiftUI

@MainActor
class ImageScrollingOverlayViewModel: ObservableObject {
    
}

struct ImageScrollingOverlayView: View {
    
    @Binding var currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        
        ZStack(alignment: .top) {
            HStack {
                ForEach(0..<imageCount, id: \.self) {image in
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: (SizeConstants.cardWidth - 50) / CGFloat(imageCount), height: 5)
                        .foregroundStyle(image == currentImageIndex ? .white : .gray)
                }
            }
//            .frame(maxWidth: SizeConstants.cardWidth - 50)
//            .frame(height: 20)
//            .background(.blue)
            .zIndex(999)
            .shadow(color: .black.opacity(1), radius: 20, x: 0, y: 0)
            .padding(.top)
            
            HStack {
                Rectangle()
                    .onTapGesture {
                        updateImageIndex(increment: false)
                    }
                
                Rectangle()
                    .onTapGesture {
                        updateImageIndex(increment: true)
                    }
            }
            .foregroundStyle(.red.opacity(0.01))
        }
    }
}

#Preview {
    ImageScrollingOverlayView(currentImageIndex: .constant(1), imageCount: 3)
}

private extension ImageScrollingOverlayView {
    
    func updateImageIndex(increment: Bool) {
        if increment {
            guard currentImageIndex < imageCount - 1 else {
                currentImageIndex = 0
                return
            }
            currentImageIndex += 1
        } else {
            guard currentImageIndex > 0 else {
                currentImageIndex = imageCount - 1
                return
            }
            currentImageIndex -= 1
        }
    }
}
