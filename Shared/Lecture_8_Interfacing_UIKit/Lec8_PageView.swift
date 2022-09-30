//
//  Lec8_PageView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec8_PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Lec8_PageViewController(pages: pages, currentPage: $currentPage)
            Lec8_PageControlView(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct Lec8_PageView_Preview: PreviewProvider {
    static var previews: some View {
        Lec8_PageView(pages: ModelData().features.compactMap({ Lec8_FeatureCardView(landmark: $0) }))
            .aspectRatio(3/2, contentMode: .fit)
    }
}
