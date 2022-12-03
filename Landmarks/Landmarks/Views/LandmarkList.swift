//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/03.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        //  Make the List Dynamic
        //  ver. Not Adopted Identifiable Protocol (-> Landmark Model)
        /*
        List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }   //  Lists work with identifiable data.
        //  You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
         */
        
        //  ver. Adopted Identifiable Protocol (-> Landmark Model)
        /*
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
         */
        
        //  --------------------------------------------------
        
        //  ver. NavigationView
        /*
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
         */
        
        //  ver. NavigationStack
        NavigationStack {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        //  Generate Previews Dynamically
        ForEach(["iPhone 14 Pro", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
