//
//  ModelData.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/03.
//

import Foundation
import Combine

//  Publisher (= 게시자)
final class ModelData: ObservableObject {   //  final Keyword로 상속 (= 재정의) 방지 (-> Preventing Overrides)
                                            //  -> You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).
                                            //  Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error. Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition.
                                            //  You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class). Any attempt to subclass a final class is reported as a compile-time error.
    
    //  Published-Prop
    @Published var landmarks: [Landmark] = load("landmarkData.json")    //  Create an array of landmarks that you initialize from landmarkData.json.
}

//  Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.
func load<T: Decodable>(_ filename: String) -> T {
    
    let data:  Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        
        data = try Data(contentsOf: file)
    } catch {
        
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    } catch {
        
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}
