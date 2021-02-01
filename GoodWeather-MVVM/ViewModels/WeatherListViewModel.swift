//
//  WeatherListViewModel.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 28/01/2021.
//

import Foundation

class WeatherListViewModel {
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ viewModel: WeatherViewModel) {
        self.weatherViewModels.append(viewModel)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func cellForRowAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
   
    private func toCelsius() {
       weatherViewModels = weatherViewModels.map { viewModel in
            let weatherModel = viewModel
        weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value - 32) * 5/9
            return weatherModel
        }
    }
    
     private func toFarenheite() {
        weatherViewModels = weatherViewModels.map { viewModel in
            let weatherModel = viewModel
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value * 9/5) + 32
            return weatherModel
        }
    }
    
     func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .farenheite:
            toFarenheite()
        }
    }
}
