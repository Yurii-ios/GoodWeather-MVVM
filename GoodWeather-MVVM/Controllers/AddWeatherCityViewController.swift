//
//  AddWeatherCityViewController.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 27/01/2021.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&lang=en&appid=9b6a277834a6cb0fcfd48f14dbb91b5f")!
            
            let weatherResource = Resource<WeatherModel>(url: weatherURL) { (data)  in
                
                let weatherVM = try! JSONDecoder().decode(WeatherModel.self, from: data)
                return weatherVM
            }
            
            WebService().load(resource: weatherResource) { [weak self] (result) in
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(viewModel: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
