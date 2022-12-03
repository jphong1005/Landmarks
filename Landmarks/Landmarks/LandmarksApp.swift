//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/01.
//

import SwiftUI

@main   //  The @main attribute identifies the app’s entry point.
struct LandmarksApp: App {  //  An app that uses the SwiftUI app life cycle has a structure that conforms to the App protocol.
    
    //  StateObject-Prop
    @StateObject private var modelData: ModelData = ModelData()   //  Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view.
    
    var body: some Scene {  //  The structure’s body property returns one or more scenes, which in turn provide content for display.
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
