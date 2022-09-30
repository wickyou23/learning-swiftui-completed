//
//  Lec7_ProfileEditorView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec7_ProfileEditorView: View {
    @Binding var profile: Lec7_Profile
    
    private var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username:").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            .listRowInsets(EdgeInsets())
            
            Toggle(isOn: $profile.prefersNotification) {
                Text("Enable Notifications").bold()
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 8))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Lec7_Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            .listRowInsets(EdgeInsets())
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
    }
}

struct Lec7_ProfileEditorView_Preview: PreviewProvider {
    static var previews: some View {
        Lec7_ProfileEditorView(profile: .constant(.default))
    }
}
