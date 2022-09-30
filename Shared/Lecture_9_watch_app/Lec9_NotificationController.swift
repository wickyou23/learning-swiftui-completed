//
//  Lec9_NotificationController.swift
//  watchapp Watch App
//
//  Created by Thang Phung on 30/09/2022.
//

import Foundation
import WatchKit
import SwiftUI
import UserNotifications

class Lec9_NotificationController: WKUserNotificationHostingController<Lec9_NotificationView> {
    var lankmark: Lec2_LandMark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: Lec9_NotificationView {
        Lec9_NotificationView(title: title, message: message, landmark: lankmark)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modeData = ModelData()
        let notifiactionData = notification.request.content.userInfo as? [String: Any]
        let aps = notifiactionData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notifiactionData?[landmarkIndexKey] as? Int {
            lankmark = modeData.landmakrs[index]
        }
    }
}
