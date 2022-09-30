//
//  Lec9_LandMarkDetailView.swift
//  watchapp Watch App
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Lec9_LandMarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Lec2_LandMark

    var landmarkIndex: Int {
        modelData.landmakrs.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            Lec1_CircleImage(image: landmark.image.resizable())
                .scaledToFit()
                .padding(16)
            
            Text(landmark.name)
                .font(.headline)
                .lineLimit(0)
            
            VStack (alignment: .leading, spacing: 8, content: {
                Toggle(isOn: $modelData.landmakrs[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                Lec1_MapView(coordinates: landmark.locationCoordinate)
                    .scaledToFit()
            })
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct Lec9_LandMarkDetailView_Preview: PreviewProvider {
    static var modelData = ModelData()
    static var previews: some View {
        Lec9_LandMarkDetailView(landmark: modelData.landmakrs[1])
            .environmentObject(modelData)
    }
}
