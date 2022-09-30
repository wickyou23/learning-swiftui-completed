//
//  CircleImageView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 16/09/2022.
//

import Foundation
import SwiftUI

struct Lec1_CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 185, height: 185, alignment: .center)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct Lec1_CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        Lec1_CircleImage(image: Image("CircleImage"))
    }
}
