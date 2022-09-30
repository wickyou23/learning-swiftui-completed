//
//  Lec1_Mapview.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 26/09/2022.
//

import Foundation
import SwiftUI
import MapKit

struct Lec1_MapView: View {
    var coordinates: CLLocationCoordinate2D
    
    @AppStorage("Lec1_MapView.Zoom")
    private var zoom: Zoom = .medium
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinates,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near:
            return 0.02
        case .medium:
            return 0.2
        case .far:
            return 2
        }
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }
}

struct Lec1_MapView_Previews: PreviewProvider {
    static var previews: some View {
        Lec1_MapView(coordinates: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
            .ignoresSafeArea()
    }
}
