//
//  ContenViewLecture_2.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 12/09/2022.
//

import SwiftUI

struct Lecture_2_View: View {
    let keywork: String
    let symbol: String
    
    ///This paddingWidth variable provides a value of 14.5 for content in a DynamicTypeSize.large Dynamic Type environment.
    ///With the ScaledMetric property wrapper, the value is proportionally larger or smaller, according to the current value of dynamicTypeSize.
    @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5
    var body: some View {
        Label(keywork, systemImage: symbol)
            .font(.title)
            .foregroundColor(.white)
            .padding(paddingWidth)
            .background(.purple.opacity(0.75), in: Capsule())
    }
}

struct Lecture_2_View_Previews: PreviewProvider {
    static let keywords = ["chives", "fern-leaf lavender"]
    static var previews: some View {
        VStack (alignment: .leading) {
            ForEach(keywords, id: \.self) { word in
                Lecture_2_View(keywork: word, symbol: "leaf")
            }
        }
        .previewDevice("iPhone 13")
    }
}
