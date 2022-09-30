//
//  Lec5_GraphCapsuleView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation
import SwiftUI

struct Lec5_GraphCapsuleView: View, Equatable {
    var index: Int
    var color: Color
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRatio: CGFloat {
        max(CGFloat(range.getMagnitude() / overallRange.getMagnitude()), 0.15)
    }
    
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / overallRange.getMagnitude())
    }
    
    var body: some View {
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

struct Lec5_GraphCapsuleView_Preview: PreviewProvider {
    static var previews: some View {
        Lec5_GraphCapsuleView(index: 0,
                              color: .blue,
                              height: 150,
                              range: 10..<50,
                              overallRange: 0..<100)
    }
}
