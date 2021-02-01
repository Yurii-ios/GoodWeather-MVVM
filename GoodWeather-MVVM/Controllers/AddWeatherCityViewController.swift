//
//  AddWeatherCityViewController.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 27/01/2021.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind { (self.addCityViewModel.city = $0) }
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind { self.addCityViewModel.state = $0 }
        }
    }
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            stateTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        print(self.addCityViewModel)
        if let city = cityNameTextField.text {
            let weatherURL = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&lang=en&appid=9b6a277834a6cb0fcfd48f14dbb91b5f")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { (data)  in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
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
