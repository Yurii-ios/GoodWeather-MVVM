//
//  WeatherCell.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 27/01/2021.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ viewModel: WeatherViewModel) {
        self.cityNameLabel.text = viewModel.name.value
        self.cityNameLabel.textColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.temperatureLabel.text = viewModel.currentTemperature.temperature.value.formatAsDegree
        self.temperatureLabel.textColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)

    }
}
