//
//  ContentView.swift
//  Shared
//
//  Created by Thang Phung on 12/09/2022.
//

import SwiftUI
import CoreLocation

struct Lecture_1_View: View {
    var body: some View {
        VStack {
            Lec1_MapView(coordinates: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            Lec1_CircleImage(image: Image("CircleImage"))
                .offset(y: -100)
                .padding(.bottom, -100)
            
            VStack (alignment: .leading, spacing: 8, content: {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title)
                Text("Descriptive text goes here.")
            })
            .padding()
            
            Spacer()
        }
    }
}

struct Lecture_1_View_Previews: PreviewProvider {
    static var previews: some View {
        Lecture_1_View()
            .previewDevice("iPhone 14 Pro")
    }
}
