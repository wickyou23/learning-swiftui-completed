//
//  Lec7_ProfileBadgeView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec7_ProfileBadgeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Completed Badges")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack {
                    Lec7_ProfileBadgeItem(name: "First Hike")
                
                    Lec7_ProfileBadgeItem(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                    
                    Lec7_ProfileBadgeItem(name: "Tenth Hike")
                        .hueRotation(Angle(degrees: 180))
                }
                .padding(.bottom)
            }
        }
    }
}

struct Lec7_ProfileBadgeItem: View {
    var name: String
    
    var body: some View {
        VStack {
            Lec4_BadgeView()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            
            Text(name)
                .font(.caption)
        }
        
    }
}

struct Lec7_ProfileBadgeView_Preview: PreviewProvider {
    static var previews: some View {
        Lec7_ProfileBadgeView()
    }
}
