//
//  WeatherModule.swift
//  Clima
//
//  Created by Admin on 19.08.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModule {
    let conditionID :Int
    let cityName :String
    let temperature :Double
    
    var temperatureString :String{
        return "\(round(temperature*10)/10)"
    }
    
    var conditionName :String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
