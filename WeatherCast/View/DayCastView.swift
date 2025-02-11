//
//  DayCastView.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import SwiftUI

struct DayCastView: View {
    @State var forecast: Forecast
    let isDay: Bool
    var body: some View {
        NavigationView {
            ZStack {
                Image(isDay ? "day" : "knight")
                    .resizable()
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        if let forecastDaysHours = forecast.hour {
                            ForEach(forecastDaysHours.indices, id: \.self) {
                                index in
                                DayForecastHourView(
                                    forecastDayHour: forecastDaysHours[index])
                            }
                        }
                    }
                }

            }
            .navigationTitle(forecast.date ?? "")
        }
        .preferredColorScheme(isDay ? .light : .dark)
    }
}
#Preview {
    var forecast = Forecast(
        date: "2025-02-11",
        hour: [
            HourCondition(
                time: "2025-02-12 00:00",
                temp_c: 10.5,
                is_day: 0,
                condition: Condition(
                    text: "Clear ",
                    icon: "//cdn.weatherapi.com/weather/64x64/night/113.png"
                )

            ),
            HourCondition(
                time: "2025-02-12 02:00",
                temp_c: 10.5,
                is_day: 0,
                condition: Condition(
                    text: "Clear ",
                    icon: "//cdn.weatherapi.com/weather/64x64/night/113.png"
                )

            ),
        ]
    )

    DayCastView(
        forecast: forecast,
        isDay: true
    )

}
