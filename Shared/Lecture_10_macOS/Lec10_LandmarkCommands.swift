//
//  Lec10_LandmarkCommand.swift
//  learning-swift-ui (macOS)
//
//  Created by Thang Phung on 30/09/2022.
//

import Foundation
import SwiftUI

struct Lec10_LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Lec2_LandMark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Lec2_LandMark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
