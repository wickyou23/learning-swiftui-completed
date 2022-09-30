//
//  Lec7_ProfileHostView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec7_ProfileHostView: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject private var modelData: ModelData
    @State private var draftProfile: Lec7_Profile = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                Lec7_ProfileSummaryView(profile: modelData.profile)
            }
            else {
                Lec7_ProfileEditorView(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct Lec7_ProfileHostView_Preview: PreviewProvider {
    static var previews: some View {
        Lec7_ProfileHostView()
            .environmentObject(ModelData())
    }
}
