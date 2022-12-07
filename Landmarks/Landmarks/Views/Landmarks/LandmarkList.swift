//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/03.
//

import SwiftUI

struct LandmarkList: View {
    
    //  EnvironmentObject-Prop (-> Subscriber = 구독자)
    //  (-> Ned: "EnvironmentObject는 너무 많은 View에서 해당 Data를 함께 쓰고 읽고, 영향을 받을거라, 매번 넘기기 귀찮으니 가장 먼저 띄울 View에 적용해서, 이후에 꼬리를 물고 나타날 View들이 바로 가져다 쓸 수 있게 해주는 것")
    @EnvironmentObject var modelData: ModelData
    
    //  State-Prop
    @State private var showFavoritesOnly: Bool = false
    
    //  Computed-Prop
    /*
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }   //  -> func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]
    }   //  Compute a filtered version of the landmarks list by checking the showFavoritesOnly property and each landmark.isFavorite value.
     */
    
    //  eq. Line 17
    var filteredLandmarks: [Landmark] {
        
        get {
            
            return modelData.landmarks.filter { landmark in
                
                return (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    }
    
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
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
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
                .environmentObject(ModelData())
        }
    }
}
