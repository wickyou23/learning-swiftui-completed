//
//  Lec8_FeatureCardView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec8_FeatureCardView: View {
    var landmark: Lec2_LandMark
    
    var body: some View {
        landmark.featuredImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(content: {
                Lec8_TextOverlay(landmark: landmark)
            })
    }
}

struct Lec8_FeatureCardView_Preview: PreviewProvider {
    static var previews: some View {
        Lec8_FeatureCardView(landmark: ModelData().landmakrs[0])
    }
}

struct Lec8_TextOverlay: View {
    var landmark: Lec2_LandMark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                
                Text(landmark.park)
                    .font(.subheadline)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}
