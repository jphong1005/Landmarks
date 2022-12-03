//
//  MapView.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/02.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //  State-Prop
    //  -> You use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view.
    //  SwiftUI manages the underlying storage and automatically updates views that depend on the value.
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()  //  Create a private state variable that holds the region information for the map.
    //  When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.
    
    //  Stored-Prop
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    //  Method
    //  -> Add a method that updates the region based on a coordinate value.
    private func setRegion(_ coordinate: CLLocationCoordinate2D) -> Void {
        
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
