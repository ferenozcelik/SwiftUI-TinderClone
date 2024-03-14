//
//  SizeConstants.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 14.03.2024.
//

import Foundation
import SwiftUI

struct SizeConstants {
    
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
}
