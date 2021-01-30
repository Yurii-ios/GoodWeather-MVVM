//
//  SettingsViewModel.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 29/01/2021.
//

import UIKit

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case farenheite = "imperial"
}

extension Unit {
    var displayName: String {
        get  {
            switch self {
            case .celsius:
                return "Celsius"
            case .farenheite:
                return "Farenheite"
            }
        }
    }
}

struct SettingsViewModel {
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.farenheite
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        } set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
