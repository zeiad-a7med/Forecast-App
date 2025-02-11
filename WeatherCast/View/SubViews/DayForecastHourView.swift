//
//  DayForecastHourView.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import SwiftUI

struct DayForecastHourView: View {
    let forecastDayHour : HourCondition
    @State var time : String = ""
    var body: some View {
        HStack {
            // Extract time part (HH:mm) from the full time string and convert to 12-hour format
            Text(time)
                .font(.system(size: 35))

            AsyncImage(
                url: URL(
                    string:
                        "https:\(forecastDayHour.condition?.icon ?? "")"
                )
            ) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .shadow(radius: 7)
                } else if phase.error != nil {
                    // Handle error state if necessary
                } else {
                    ProgressView()
                        .frame(width: 70, height: 70)
                }
            }

            Text(
                "\(String(format: "%.1f", forecastDayHour.temp_c ?? 0))°"
            )
            .font(.system(size: 35))
        }
        .frame(width: 300)
        .padding(20)
        .background(.primary.opacity(0.4))
        .cornerRadius(15)
        .onAppear{
            time = convertTo12HourFormat(
                timeString: String(forecastDayHour.time ?? " ")) ?? " "
        }
    }
    func convertTo12HourFormat(timeString: String) -> String? {
        // Step 1: Extract only the time portion (HH:mm) from the full timestamp
        let timeComponents = timeString.split(separator: " ")  // Split into date and time
        guard timeComponents.count > 1 else { return nil }

        let time = String(timeComponents[1])  // Get the time part (e.g., "00:00")

        // Step 2: Create a DateFormatter to parse the "HH:mm" format
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "HH:mm"  // 24-hour format

        if let date = inputFormatter.date(from: time) {
            // Step 3: Create another DateFormatter to convert to 12-hour format with AM/PM
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "h a"  // 12-hour format with AM/PM
            return outputFormatter.string(from: date)
        }

        return nil
    }
}

#Preview {
    DayForecastHourView(
        forecastDayHour:HourCondition(
            time: "2025-02-12 02:00",
            temp_c: 10.1,
            is_day: 1,
            condition: Condition(
                text: "Clear",
                icon: "//cdn.weatherapi.com/weather/64x64/night/113.png"
            )
        )
    )
}
