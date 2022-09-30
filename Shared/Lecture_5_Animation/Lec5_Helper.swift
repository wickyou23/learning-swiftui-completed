//
//  Lec5_Helper.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation

struct Lec5_Helper {
    static func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double> where C.Element == Range<Double> {
        guard !ranges.isEmpty else { return 0..<0 }
        let low = ranges.lazy.map({ $0.lowerBound }).min()!
        let hight = ranges.lazy.map({ $0.upperBound }).max()!
        return low..<hight
    }
}

extension Range where Bound == Double {
    func getMagnitude() -> Double {
        upperBound - lowerBound 
    }
}
