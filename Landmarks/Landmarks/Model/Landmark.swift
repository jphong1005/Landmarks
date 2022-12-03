//
//  Landmark.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/03.
//

import Foundation
import SwiftUI
import CoreLocation

//  Create a Landmark Model
struct Landmark: Hashable, Codable, Identifiable {    //  Hashable, Codable, Identifiable Protocol 채택
                                        //  Adding Codable conformance makes it easier to move data between the structure and a data file.
    
                                        //  Hashable: A type that can be hashed into a Hasher to produce an integer hash value.
                                        //              -> 정수 Hash 값을 제공하는 타입
                                        //  Codable: Decodable + Encodable Protocol
                                        //              -> Structure와 Data File 간의 Data를 이동을 더 쉽게 해줌
                                        //  Identifiable: A class of types whose instances hold the value of an entity with stable identity.
                                        //              -> Hashable Protocol을 채택받은 id Property 하나만을 가지고 있고,
                                        //                  id Prop으로 고유 개채를 구분할 수 있음
    
    //  Stored-Props
    var name: String
    var state: String
    var id: Int
    var park: String
    var description: String
    
    private var imageName: String
    
    //  Computed-Prop
    var image: Image {
        
        Image(imageName)
    }
    
    //  eq. Line 31
    /*
    var image: Image {
        
        get {
            
            return Image(imageName)
        }
    }
     */
    
    private var coordinates: Coordinates
    
    //  Computed-Prop
    var locationCoordinate: CLLocationCoordinate2D {
        
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }
    
    //  eq. Line 50
    /*
    var locationCoordinate: CLLocationCoordinate2D {
        
        get {
            
            return CLLocationCoordinate2D(latitude: coordinates.latitude,
                                          longitude: coordinates.longitude)
        }
    }
     */
    
    struct Coordinates: Hashable, Codable {
        
        //  Stored-Props
        var longitude: Double
        var latitude: Double
    }
}
