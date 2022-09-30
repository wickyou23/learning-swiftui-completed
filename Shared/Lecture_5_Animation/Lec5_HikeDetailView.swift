//
//  Lec5_HikeDetail.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 27/09/2022.
//

import Foundation
import SwiftUI

struct Lec5_HikeDetailView: View {
    let hike: Lec5_Hike
    @State private var dataToShow = \Lec5_Hike.Observation.elevation
    
    let buttons = [
        ("Elevation", \Lec5_Hike.Observation.elevation),
        ("Heart Rate", \Lec5_Hike.Observation.heartRate),
        ("Pace", \Lec5_Hike.Observation.pace)
    ]
    
    var body: some View {
        VStack {
            Lec5_GraphView(hike: hike, path: dataToShow)
                .frame(height: 200)
                .padding(.bottom, 20)
            
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundColor(dataToShow == value.1 ? .gray : .accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}

struct Lec5_HikeDetailView_Preview: PreviewProvider {
    static var previews: some View {
        let hike = ModelData().hikes[0]
        Lec5_HikeDetailView(hike: hike)
    }
}
