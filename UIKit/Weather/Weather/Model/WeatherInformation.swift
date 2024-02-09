//
//  WatherInformation.swift
//  Weather
//
//  Created by 이희웅 on 2023/06/11.
//

import Foundation

// codable 프로토콜은 객체 <-> 특정 인코딩 타입으로 변환을 쉽게 가능하도록 설계되었다.
struct WeatherInformation : Codable{
    let weather : [Weather]
    let temp : Temp
    let name : String
    
    // 클래스 프로퍼티명과 데이터셋의 네이밍이 다른경우 매칭하여 잘 동작할 수 있도록 설계된 프로토콜 : CodingKey
    enum CodingKeys : String, CodingKey{
        case weather
        case temp = "main"
        case name
    }
    
}

struct Weather : Codable{
    let id : Int
    let main : String
    let description : String
    let icon : String
}

struct Temp: Codable{
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys : String, CodingKey{
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
