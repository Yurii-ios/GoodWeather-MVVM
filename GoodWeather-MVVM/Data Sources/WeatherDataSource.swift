//
//  WeatherDataSource.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 01/02/2021.
//

import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "cell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel ) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.weatherListViewModel.weatherViewModels.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("Weather cell not found")
        }
        
        let weatherViewModel = self.weatherListViewModel.cellForRowAt(indexPath.row)
        cell.cityNameLabel.text = weatherViewModel.name.value
        cell.temperatureLabel.text = weatherViewModel.currentTemperature.temperature.value.formatAsDegree
        return cell
    }
}
