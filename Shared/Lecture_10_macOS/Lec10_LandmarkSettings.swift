//
//  Lec10_LandmarkSettings.swift
//  learning-swift-ui (macOS)
//
//  Created by Thang Phung on 30/09/2022.
//

import Foundation
import SwiftUI

struct Lec10_LandmarkSettings: View {
    @AppStorage("Lec1_MapView.Zoom")
    private var zoom: Lec1_MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(Lec1_MapView.Zoom.allCases, id: \.id) { item in
                    Text(item.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

struct Lec10_LandmarkSettings_Preview: PreviewProvider {
    static var previews: some View {
        Lec10_LandmarkSettings()
    }
}
