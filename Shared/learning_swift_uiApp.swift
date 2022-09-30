//
//  learning_swift_uiApp.swift
//  Shared
//
//  Created by Thang Phung on 12/09/2022.
//

import SwiftUI

@main
struct learning_swift_uiApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            #if os(watchOS)
            Lec9_ContentView()
                .environmentObject(modelData)
            #elseif os(macOS)
            Lec10_ContentView()
                .environmentObject(modelData)
            #else
            Lec2_ContentView()
                .environmentObject(modelData)
            #endif
        }
        #if os(macOS)
        .commands(content: {
            Lec10_LandmarkCommands()
        })
        #endif
        
        #if os(macOS)
        Settings {
            Lec10_LandmarkSettings()
        }
        #endif
        
        #if os(watchOS)
        ///Edit the watchApp scheme
        ///and then switch the watch interface section is from "main" to "dynamic notification",
        ///and then select a file .apns from the notification payload section  (just for test push notification)
        WKNotificationScene(controller: Lec9_NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
