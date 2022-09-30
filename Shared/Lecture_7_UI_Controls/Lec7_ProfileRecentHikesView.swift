//
//  Lec7_ProfileRecentHikesView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec7_ProfileRecentHikesView: View {
    @EnvironmentObject private var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recent Hikes")
                .font(.headline)
            
            Lec5_HikeView(hike: modelData.hikes[1])
        }
    }
}


struct Lec7_ProfileRecentHikesView_Preview: PreviewProvider {
    static var previews: some View {
        Lec7_ProfileRecentHikesView()
            .environmentObject(ModelData())
    }
}
