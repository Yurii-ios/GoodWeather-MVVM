//
//  WeatherListViewModel.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 28/01/2021.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
}


struct WeatherViewModel: Decodable {
    let name: String
    let currentTemperature: TemperatureVM
}

struct TemperatureVM: Decodable {
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
}
