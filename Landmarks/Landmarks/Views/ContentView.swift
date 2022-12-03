//
//  ContentView.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/01.
//

import SwiftUI

struct ContentView: View {  //  The first structure conforms to the View protocol and describes the view’s content and layout.
    
    //  For Dark Mode
    @Environment (\.colorScheme) var colourScheme
    
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {  //  The second structure declares a preview for that view.
    static var previews: some View {
        
        //  Generate Previews Dynamically
        ForEach(["iPhone 14 Pro", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .preferredColorScheme(deviceName == "iPhone SE (3rd generation)" ? .dark : .light)
        }
    }
}
