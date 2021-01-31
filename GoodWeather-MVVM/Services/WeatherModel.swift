//
//  WeatherModel.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 29/01/2021.
//

import UIKit

struct WeatherModel: Decodable {
    let name: String
    var currentTemperature: TemperatureVM
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureVM: Decodable {
    var temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
