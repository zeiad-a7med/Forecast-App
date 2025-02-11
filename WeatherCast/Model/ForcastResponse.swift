//
//  ForcastResponse.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
struct ForcastResponse : Codable{
    var location : MyLocation?
    var current : CurrentWeatherData?
    var forecast : ForecastData?
}
struct ForecastData : Codable{
    var forecastday : [Forecast]?
}
