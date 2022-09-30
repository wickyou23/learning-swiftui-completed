//
//  Lec2_LandMarkRowView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 26/09/2022.
//

import Foundation
import SwiftUI

struct Lec2_LandMarkRowView: View {
    var landmark: Lec2_LandMark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 6) {
                Text(landmark.name)
                
                #if os(macOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct Lec2_LandMarkRowView_Preview: PreviewProvider {
    static var modelData = ModelData()
    static var previews: some View {
        Lec2_LandMarkRowView(landmark: modelData.landmakrs[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
