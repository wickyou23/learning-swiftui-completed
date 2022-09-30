//
//  Lec6_CatogeryView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 28/09/2022.
//

import Foundation
import SwiftUI

struct Lec6_CategoryHomeView: View {
    @EnvironmentObject private var modelData: ModelData
    @State private var isShowProfile = false
    
    var body: some View {
        NavigationView {
            List {
                Lec8_PageView(pages: modelData.features.map({ Lec8_FeatureCardView(landmark: $0) }))
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Lec6_CategoryRowView(categoryName: key, landmarks: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    isShowProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $isShowProfile) {
                Lec7_ProfileHostView()
                    .environmentObject(modelData)
            }
        }
    }
}

struct Lec6_CategoryHomeView_Preview: PreviewProvider {
    static var previews: some View {
        Lec6_CategoryHomeView()
            .environmentObject(ModelData())
    }
}
