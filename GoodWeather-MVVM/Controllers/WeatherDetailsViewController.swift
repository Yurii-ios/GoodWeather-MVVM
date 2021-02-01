//
//  WeatherDetailsViewController.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 31/01/2021.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatyreLabel: UILabel!
    @IBOutlet weak var temperatureMinLabel: UILabel!
    @IBOutlet weak var temperatureMaxLabel: UILabel!
    
    var weatherViewmodel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVMBindings()
        
//        if let weatherVM = weatherViewmodel {
//            self.cityNameLabel.text = weatherVM.name.value
//            self.temperatyreLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
//            self.temperatureMinLabel.text = weatherVM.currentTemperature.temperatureMin.value.formatAsDegree
//            self.temperatureMaxLabel.text = weatherVM.currentTemperature.temperatureMax.value.formatAsDegree
//        }
    }
    
    private func setupVMBindings() {
        if let weatherVM = weatherViewmodel {
            weatherVM.name.bind { self.cityNameLabel.text = $0 }
            weatherVM.currentTemperature.temperature.bind { self.temperatyreLabel.text = $0.formatAsDegree }
            weatherVM.currentTemperature.temperatureMin.bind { self.temperatureMinLabel.text = $0.formatAsDegree }
            weatherVM.currentTemperature.temperatureMax.bind { self.temperatureMaxLabel.text = $0.formatAsDegree }
        }
        
        // change the value  after few seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.weatherViewmodel?.name.value = "Wroclaw"
        }
    }
}
