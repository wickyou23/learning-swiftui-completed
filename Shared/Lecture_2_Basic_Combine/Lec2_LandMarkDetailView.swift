//
//  Lec2_LandMarkDetailView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 26/09/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Lec2_LandMarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Lec2_LandMark
    
    var landmarkIndex: Int {
        modelData.landmakrs.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            Lec1_MapView(coordinates: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 200)
            
            Lec1_CircleImage(image: landmark.image)
                .offset(y: -100)
                .padding(.bottom, -100)
            
            VStack (alignment: .leading, spacing: 8, content: {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Lec3_FavoriteButton(isSet: $modelData.landmakrs[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }

                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title)
                Text(landmark.description)
            })
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Lec2_LandMarkDetailView_Preview: PreviewProvider {
    static var modelData = ModelData()
    static var previews: some View {
        Lec2_LandMarkDetailView(landmark: modelData.landmakrs[0])
    }
}
