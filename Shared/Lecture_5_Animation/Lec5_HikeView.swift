//
//  Lec5_HikeView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation
import SwiftUI

struct Lec5_HikeView: View {
    var hike: Lec5_Hike
    @State private var isShowDetail = true
    
    var body: some View {
        VStack {
            HStack {
                Lec5_GraphView(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack (alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        isShowDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(isShowDetail ? 90 : 0))
                        .scaleEffect(isShowDetail ? 1.5 : 1)
                }

            }
            .padding()
            
            if isShowDetail {
                Lec5_HikeDetailView(hike: hike)
                    .padding()
                    .transition(.moveAndFade)
            }
            
            Spacer()
        }
    }
}


struct Lec5_HikeView_Preview: PreviewProvider {
    static var hike = ModelData().hikes[0]
    static var previews: some View {
        Lec5_HikeView(hike: hike)
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}
