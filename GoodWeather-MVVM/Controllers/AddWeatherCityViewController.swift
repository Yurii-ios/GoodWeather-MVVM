//
//  AddWeatherCityViewController.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 27/01/2021.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&lang=en&appid=9b6a277834a6cb0fcfd48f14dbb91b5f")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { (data)  in
                
                let weatherVM = try! JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            WebService().load(resource: weatherResource) { (result) in
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
