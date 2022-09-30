//
//  Lec4_BadgeView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation
import SwiftUI

struct Lec4_BadgeView: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            Lec4_RotatedBadgeSymbolView(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            Lec4_BadgeBackgroundView()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Lec4_BadgeView_Preview: PreviewProvider {
    static var previews: some View {
        Lec4_BadgeView()
    }
}
