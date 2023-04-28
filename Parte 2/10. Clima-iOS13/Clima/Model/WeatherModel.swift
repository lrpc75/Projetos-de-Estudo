//
//  WeatherModel.swift
//  Clima
//
//  Created by Usuário on 19/03/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    var condicionName: String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "smoke"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.sun"
        default:
            return "questionmark.square.dashed"
        }
    }
}
