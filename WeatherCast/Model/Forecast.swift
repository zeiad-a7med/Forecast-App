//
//  Forecast.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation

struct Forecast: Codable {
    var date: String?
    var day: DayCondition?
    var hour: [HourCondition]?

}
struct DayCondition: Codable {
    var maxtemp_c: Double?
    var mintemp_c: Double?
    var condition: Condition?

    var formattedMaxtemp_c: String {
        return String(format: "%.1f", maxtemp_c ?? 0)
    }
    var formattedMintemp_c: String {
        return String(format: "%.1f", mintemp_c ?? 0)
    }
}
struct HourCondition: Codable{
    var time: String?
    var temp_c: Double?
    var is_day: Int?
    var condition: Condition?

    func getFormattedHour() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"  // Input format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")  // Ensure consistent parsing
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")  // Handle time zones properly

        if let date = dateFormatter.date(from: time ?? "") {
            // Step 1: Create a new DateFormatter for time formatting
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "h a"  // This will give "12 PM", "1 AM", etc.

            // Step 2: Return the formatted time
            return timeFormatter.string(from: date)
        }

        return nil
    }

}
