//
//  Lec5_GraphView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation
import SwiftUI

struct Lec5_GraphView: View {
    var hike: Lec5_Hike
    var path: KeyPath<Lec5_Hike.Observation, Range<Double>>
    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }
    
    var body: some View {
        let datas = hike.observations
        let overallRange = Lec5_Helper.rangeOfRanges(datas.lazy.map({ $0[keyPath: path] }))
        let maxMagnitude = datas.map({ $0[keyPath: path].getMagnitude() }).max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / overallRange.getMagnitude())
        
        return GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: geometry.size.width / 120) {
                ForEach(Array(datas.enumerated()), id: \.offset) { index, observation in
                    Lec5_GraphCapsuleView(index: index,
                                          color: color,
                                          height: geometry.size.height,
                                          range: observation[keyPath: path],
                                          overallRange: overallRange)
                    .animation(.ripple())
                }
                .offset(x: 0, y: geometry.size.height * heightRatio)
            }
        }
    }
}

struct Lec5_GraphView_Preview: PreviewProvider {
    static var hike = ModelData().hikes[1]
    static var previews: some View {
        Lec5_GraphView(hike: hike, path: \.elevation)
            .frame(height: 200)
    }
}

extension Animation {
    static func ripple() -> Animation {
        .spring(dampingFraction: 0.5)
        .speed(2)
    }
}
