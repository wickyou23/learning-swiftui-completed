//
//  Lec10_ContentView.swift
//  learning-swift-ui (macOS)
//
//  Created by Thang Phung on 30/09/2022.
//

import Foundation
import SwiftUI

struct Lec10_ContentView: View {
    var body: some View {
        Lec2_LandMarkListView()
    }
}

struct Lec10_ContentView_Preview: PreviewProvider {
    static var previews: some View {
        Lec10_ContentView().environmentObject(ModelData())
    }
}
