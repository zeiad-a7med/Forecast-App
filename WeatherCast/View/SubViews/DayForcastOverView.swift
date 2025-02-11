//
//  DayForcastOverView.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import SwiftUI

struct DayForcastOverView: View {
    var forecast: Forecast
    @State var dayName = ""

    var body: some View {
        HStack {
            Text(dayName)
                .font(.system(size: 25))
                .frame(width: 65)
            AsyncImage(
                url: URL(string: "https:\(forecast.day?.condition?.icon ?? "")")
            ) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .shadow(radius: 7)

                } else if phase.error != nil {
                } else {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }

            Text(
                "\(String(format: "%.1f", forecast.day?.mintemp_c ?? 0))° - \(String(format: "%.1f", forecast.day?.maxtemp_c ?? 0))°"
            )
            .font(.system(size: 25))
        }
        .onAppear {
            dayName = getDayName(from: forecast.date ?? "") ?? ""
        }
    }
    func getDayName(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"  // Input format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")  // Ensure consistent parsing
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")  // Handle time zones properly

        if let date = dateFormatter.date(from: dateString) {
            // Check if the date is today's date
            let calendar = Calendar.current
            if calendar.isDateInToday(date) {
                return "Today"
            }

            // Get the full day name
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "EEEE"  // Get full day name
            dayFormatter.locale = Locale(identifier: "en_US")  // Set English output
            let  day : String = dayFormatter.string(from: date)
            return String(day.prefix(3))
        }

        return nil
    }
}

#Preview {
        
}
