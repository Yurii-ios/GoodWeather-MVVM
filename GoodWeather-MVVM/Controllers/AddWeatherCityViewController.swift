//
//  AddWeatherCityViewController.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 27/01/2021.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    
    
    @IBAction func saveCityButtonPressed(_ sender: UIButton) {
    
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
