//
//  Lec4_BadgeBackground.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation
import SwiftUI

struct Lec4_BadgeBackgroundView: View {
    static let defaultGradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let defaultGradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset: CGFloat = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(to: CGPoint(
                    x: width * 0.95 + xOffset,
                    y: height * (0.20 + HexagonParameters.adjustment)
                ))
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(to: CGPoint(
                        x: width * segment.line.x + xOffset,
                        y: height * segment.line.y
                    ))
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        ))
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.defaultGradientStart, Self.defaultGradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct Lec4_BadgeBackgroundView_Preview: PreviewProvider {
    static var previews: some View {
        Lec4_BadgeBackgroundView()
    }
}
