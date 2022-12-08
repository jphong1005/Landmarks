//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/03.
//

import SwiftUI

struct FavoriteButton: View {
    
    //  State Binding-Prop
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet == true ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))  //  constant(_:) -> Creates a binding with an immutable value.
    }
}
