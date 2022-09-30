//
//  Lec7_Profile.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 28/09/2022.
//

import Foundation

struct Lec7_Profile {
    var username: String
    var prefersNotification = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Lec7_Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
