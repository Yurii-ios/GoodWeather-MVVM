//
//  WeatherListViewModel.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 28/01/2021.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherModel]()
    
    mutating func addWeatherViewModel(_ viewModel: WeatherModel) {
        self.weatherViewModels.append(viewModel)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func cellForRowAt(_ index: Int) -> WeatherModel {
        return self.weatherViewModels[index]
    }
    
    mutating private func toCelsius() {
       weatherViewModels = weatherViewModels.map { viewModel in
            var weatherModel = viewModel
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    mutating private func toFarenheite() {
        weatherViewModels = weatherViewModels.map { viewModel in
            var weatherModel = viewModel
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    mutating func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .farenheite:
            toFarenheite()
        }
    }
}
