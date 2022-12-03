//
//  CircleImage.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/02.
//

import SwiftUI

struct CircleImage: View {
    
    //  Stored-Prop
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
