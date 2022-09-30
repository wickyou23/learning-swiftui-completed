//
//  Lec7_ProfileSummaryView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec7_ProfileSummaryView: View {
    var profile: Lec7_Profile
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notification: \(profile.prefersNotification ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                Lec7_ProfileBadgeView()
                
                Divider()
                
                Lec7_ProfileRecentHikesView()
            }
        }
    }
}

struct Lec7_ProfileSummaryView_Preview: PreviewProvider {
    static var previews: some View {
        Lec7_ProfileSummaryView(profile: Lec7_Profile.default)
            .environmentObject(ModelData())
    }
}
