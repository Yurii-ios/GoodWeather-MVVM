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
}
