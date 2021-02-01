//
//  WeatherListTableViewController.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 27/01/2021.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - Table View Methods
extension WeatherListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCel
        guard let cells = cell else { return WeatherCel() }
        
        let weatherVM = self.weatherListViewModel.cellForRowAt(indexPath.row)
        cell?.configure(weatherVM)
        return cells
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

//MARK: - Navigation
extension WeatherListTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAddCityIdentifier" {
            prepareSegueForAddWeatherCity(segue: segue)
            
        } else if segue.identifier == "toSettingsIdentifier" {
            prepareSegueForSettings(segue: segue)
        } else if segue.identifier == "toWeatherDetailsIdentifier" {
            prepareSegueForWeatherDetailsVievController(segue: segue)
        }
     }
    
    // toAddCityIdentifier
    private func prepareSegueForAddWeatherCity(segue: UIStoryboardSegue) {
        
        guard let navController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found.")
        }
        
        guard let addWeatherCityVC = navController.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found.")
        }
        addWeatherCityVC.delegate = self
    }
    
    // toSettingsIdentifier
    private func prepareSegueForSettings(segue: UIStoryboardSegue) {
        guard let navController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found.")
        }
        
        guard let settingsTVC = navController.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found.")
        }
        settingsTVC.delegate = self
    }
    
    // toWeatherDetailsIdentifier
    private func prepareSegueForWeatherDetailsVievController(segue: UIStoryboardSegue) {
    
        guard let weatherDetailVC = segue.destination as? WeatherDetailsViewController, let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("WeatherDetailsViewController not found.")
        }
        let weatherViewModel = self.weatherListViewModel.cellForRowAt(indexPath.row)
        weatherDetailVC.weatherViewmodel = weatherViewModel
    }
}

//MARK: - SettingsDelegate
extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(viewModel: SettingsViewModel) {
        
        self.weatherListViewModel.updateUnit(to: viewModel.selectedUnit)
        self.tableView.reloadData()
    }
}

//MARK: - AddWeatherDelegate
extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        
        self.weatherListViewModel.addWeatherViewModel(viewModel)
        self.tableView.reloadData()
    }
}
