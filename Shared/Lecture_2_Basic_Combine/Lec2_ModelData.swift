//
//  Lec2_ModelData.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 26/09/2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmakrs: [Lec2_LandMark] = load("landmarkData.json")
    @Published var profile: Lec7_Profile = .default
    var hikes: [Lec5_Hike] = load("hikeData.json")
    
    var categories: [String: [Lec2_LandMark]] {
        Dictionary(
            grouping: landmakrs,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [Lec2_LandMark] {
        landmakrs.filter({ $0.isFeatured })
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
