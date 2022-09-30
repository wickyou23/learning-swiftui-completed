//
//  Lec3_FavoriteButton.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 26/09/2022.
//

import Foundation
import SwiftUI

struct Lec3_FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct Lec3_FavoriteButton_Preview: PreviewProvider {
    @State static var isSet = true
    static var previews: some View {
        Lec3_FavoriteButton(isSet: $isSet)
    }
}
