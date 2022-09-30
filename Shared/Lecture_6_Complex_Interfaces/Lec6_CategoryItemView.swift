//
//  Lec6_CategoryItemView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 28/09/2022.
//

import Foundation
import SwiftUI

struct Lec6_CategoryItemView: View {
    var landmark: Lec2_LandMark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(8)
            Text(landmark.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}

struct Lec6_CategoryItemView_Preview: PreviewProvider {
    static var previews: some View {
        Lec6_CategoryItemView(landmark: ModelData().landmakrs[1])
    }
}
