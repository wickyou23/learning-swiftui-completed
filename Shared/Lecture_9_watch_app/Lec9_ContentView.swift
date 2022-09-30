//
//  Lec9_ContentView.swift
//  watchapp Watch App
//
//  Created by Thang Phung on 29/09/2022.
//

import Foundation
import SwiftUI

struct Lec9_ContentView: View {
    var body: some View {
        Lec2_LandMarkListView()
    }
}

struct Lec9_ContentView_Preview: PreviewProvider {
    static private var modelData = ModelData()
    static var previews: some View {
        Lec9_ContentView()
            .environmentObject(modelData)
    }
}
