//
//  WeatherListTableViewController.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 27/01/2021.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension WeatherListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCel
        guard let cells = cell else { return WeatherCel() }
        cells.cityNameLabel.text = "Wroclaw"
        cells.cityNameLabel.textColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        cells.temperatureLabel.text = "22ºC"
        cells.temperatureLabel.textColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        return cells
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found.")
        }
        
        guard let addWeatherCityVC = navController.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found.")
        }
        addWeatherCityVC.delegate = self
    }
}

//MARK: - AddWeatherDelegate
extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        print(viewModel.name)
    }
}
