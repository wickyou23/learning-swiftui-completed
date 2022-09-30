//
//  Lec2_ContentView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 26/09/2022.
//

import Foundation
import SwiftUI

struct Lec2_ContentView: View {
    @State private var tab: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $tab) {
            Lec6_CategoryHomeView()
                .tabItem({
                    Label("Featured", systemImage: "star")
                })
                .tag(Tab.featured)
            Lec2_LandMarkListView()
                .tabItem({
                    Label("List", systemImage: "list.bullet")
                })
                .tag(Tab.list)
        }
    }
}

struct Lec2_ContentView_Preview: PreviewProvider {
    static var previews: some View {
        Lec2_ContentView().environmentObject(ModelData())
    }
}
