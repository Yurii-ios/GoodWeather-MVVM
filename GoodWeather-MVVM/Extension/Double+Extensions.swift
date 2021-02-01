//
//  Double+Extensions.swift
//  GoodWeather-MVVM
//
//  Created by Yurii Sameliuk on 29/01/2021.
//

import UIKit

extension Double {
    var formatAsDegree: String{
        return String(format: "%.0f°", self)
    }
}
