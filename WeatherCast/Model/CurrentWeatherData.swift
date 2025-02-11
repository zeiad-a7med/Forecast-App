//
//  CurrentWeatherData.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
struct CurrentWeatherData : Codable{
    var temp_c : Double?
    var is_day : Int?
    var condition : Condition?
    var pressure_in : Double?
    var humidity : Int?
    var feelslike_c : Double?
    var vis_km : Double?
    
    var formattedTempC: String {
            return String(format: "%.1f", temp_c ?? 0)
    }
    var formattedPressure_in: String {
            return String(format: "%.1f", pressure_in ?? 0)
    }
    var formattedVis_km: String {
            return String(format: "%.1f", vis_km ?? 0)
    }
    var formattedFeelslike_c: String {
            return String(format: "%.1f", feelslike_c ?? 0)
    }
}
struct Condition : Codable{
    var text : String?
    var icon : String?
}
