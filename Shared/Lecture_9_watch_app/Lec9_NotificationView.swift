//
//  Lec9_NotificationView.swift
//  watchapp Watch App
//
//  Created by Thang Phung on 30/09/2022.
//

import Foundation
import SwiftUI

struct Lec9_NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Lec2_LandMark?
    
    var body: some View {
        VStack {
            if landmark != nil {
                Lec1_CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct Lec9_NotificationView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            Lec9_NotificationView()
            Lec9_NotificationView(
                title: "Turtle Rock",
                message: "You are within 5 miles of Turtle Rock",
                landmark: ModelData().landmakrs[0]
            )
        }
    }
}
