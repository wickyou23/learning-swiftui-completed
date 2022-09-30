//
//  Lec6_CatogeryRowView.swift
//  learning-swift-ui (iOS)
//
//  Created by Thang Phung on 28/09/2022.
//

import Foundation
import SwiftUI

struct Lec6_CategoryRowView: View {
    var categoryName: String
    var landmarks: [Lec2_LandMark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(landmarks, id: \.id) { landmark in
                        NavigationLink {
                            Lec2_LandMarkDetailView(landmark: landmark)
                        } label: {
                            Lec6_CategoryItemView(landmark: landmark)
                        }
                    }
                }
                .frame(height: 185)
            }
        }
    }
}

struct Lec6_CategoryRowView_Preview: PreviewProvider {
    static var previews: some View {
        let value = ModelData().categories.first!
        Lec6_CategoryRowView(categoryName: value.key, landmarks: value.value)
    }
}
