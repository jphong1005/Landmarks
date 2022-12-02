//
//  ContentView.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/01.
//

import SwiftUI

struct ContentView: View {  //  The first structure conforms to the View protocol and describes the view’s content and layout.
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {  //  The second structure declares a preview for that view.
    static var previews: some View {
        ContentView()
    }
}
