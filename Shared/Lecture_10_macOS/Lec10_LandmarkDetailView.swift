//
//  Lec10_LandmarkDetailView.swift
//  learning-swift-ui (macOS)
//
//  Created by Thang Phung on 30/09/2022.
//

import Foundation
import SwiftUI
import MapKit

struct Lec10_LandMarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Lec2_LandMark
    
    var landmarkIndex: Int {
        modelData.landmakrs.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topTrailing) {
                Lec1_MapView(coordinates: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                Button("Open In Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack (alignment: .leading, spacing: 8, content: {
                HStack(spacing: 24) {
                    Lec1_CircleImage(image: landmark.image)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            Lec3_FavoriteButton(isSet: $modelData.landmakrs[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                .padding(.bottom, 20)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title)
                Text(landmark.description)
            })
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
            
            Spacer()
        }
        .navigationTitle(landmark.name)
    }
}

struct Lec10_LandMarkDetailView_Preview: PreviewProvider {
    static var modelData = ModelData()
    static var previews: some View {
        Lec10_LandMarkDetailView(landmark: modelData.landmakrs[0])
            .environmentObject(modelData)
    }
}
