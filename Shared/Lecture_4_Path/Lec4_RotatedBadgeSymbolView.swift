//
//  Lec4_RotatedBadgeSymbolView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation
import SwiftUI

struct Lec4_RotatedBadgeSymbolView: View {
    let angle: Angle
    
    var body: some View {
        Lec4_BadgeSymbolView()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct Lec4_RotatedBadgeSymbolView_Preview: PreviewProvider {
    static var previews: some View {
        Lec4_RotatedBadgeSymbolView(angle: Angle(degrees: 5))
    }
}
