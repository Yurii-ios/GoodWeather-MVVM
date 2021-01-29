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
    
}
