//
//  ContentView.swift
//  Codeable_Test
//
//  Created by Flapper on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    var rgb : RGBColor = RGBColor(r: 0.2, g: 1.1, b: 3.2)
    var coordinate : Coordinate? = Coordinate(latitude: 1.3, longitude: 4.4, elevation: 5.5)
    
    var body: some View {
        VStack {
            Text(setText())
            Button("Encoding") {
                guard let json = try? JSONEncoder().encode(coordinate) else { return }
                print(String(decoding: json, as: UTF8.self))
            }
        }
        .padding()
    }
    
    func setText() -> String{
        if let json = try? JSONEncoder().encode(rgb) {
            if let decode = try? JSONDecoder().decode(RGBColor.self, from: json){
                print(decode.r, decode.g, decode.b)
            }
            return String(decoding: json, as: UTF8.self)
        }else{
            return ""
        }
    }
}

// MARK: - Encoder.unkeyedContainer()
struct RGBColor {
    var r: Double
    var g: Double
    var b: Double
}

extension RGBColor: Decodable {
    init(from decoder: Decoder) throws {
        var values = try decoder.unkeyedContainer()
        r = try values.decode(Double.self)
        g = try values.decode(Double.self)
        b = try values.decode(Double.self)
    }
}

extension RGBColor: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(r)
        try container.encode(g)
        try container.encode(b)
    }
}

// MARK: - Encoder.container()
struct Coordinate {
    var latitude: Double
    var longitude: Double
    var elevation: Double

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case additionalInfo
    }
    
    enum AdditionalInfoKeys: String, CodingKey {
        case elevation
    }
}

extension Coordinate: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
        
        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
}

extension Coordinate: Encodable {
    func encode(to encoder: Encoder) throws {
        // container 생성
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // 코딩 키 등록
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        
        // 중첩 코딩키 컨테이너 등록
        // keyedBy = nestedkey (내부 키)
        // forKey = 메인 키
        var additionalInfo = container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        
        
        // encode
        try additionalInfo.encode(elevation, forKey: .elevation)
    }
}

#Preview {
    ContentView()
}
