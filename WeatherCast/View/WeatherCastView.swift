//
//  ContentView.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import SwiftUI

struct WeatherCastView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Image(viewModel.isDay ? "day" : "knight")
                    .resizable()
                    .ignoresSafeArea(.all)
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    VStack {
                        Text(viewModel.data?.location?.name ?? "")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(.top, 80)
                        Text(
                            "\(viewModel.data?.current?.formattedTempC ?? "0")°"
                        )
                        .font(.system(size: 50))
                        Text(viewModel.data?.current?.condition?.text ?? "")
                            .font(.system(size: 30))
                        HStack {
                            Text(
                                "H:\(viewModel.data?.forecast?.forecastday?.first?.day?.formattedMaxtemp_c ?? "")°"
                            )
                            .font(.system(size: 30))
                            Text(
                                "L:\(viewModel.data?.forecast?.forecastday?.first?.day?.formattedMintemp_c ?? "")°"
                            )
                            .font(.system(size: 30))
                        }

                        AsyncImage(
                            url: URL(
                                string:
                                    "https:\(viewModel.data?.current?.condition?.icon ?? "")"
                            )
                        ) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 7)

                            } else if phase.error != nil {
                            } else {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                        }

                        Spacer()
                        VStack(alignment: .leading) {
                            Text("3-DAY FORECAST")

                            if let forecastDays = viewModel.data?.forecast?
                                .forecastday
                            {
                                ForEach(forecastDays.indices, id: \.self) { i in
                                    Divider()
                                        .frame(height: 2)
                                        .background(.primary)

                                    NavigationLink(destination: {
                                        DayCastView(
                                            forecast: forecastDays[i],
                                            isDay: viewModel.isDay)
                                    }) {
                                        DayForcastOverView(
                                            forecast: forecastDays[i]
                                        )
                                        .frame(width: 280)
                                    }
                                    .foregroundStyle(.primary)
                                }
                            }

                        }.frame(width: 280, height: 220)
                            .padding(20)
                            .background(.primary.opacity(0.4))
                            .cornerRadius(15)

                        VStack {
                            HStack {
                                AboutWeatherView(
                                    title: "VISIBILITY",
                                    details:
                                        "\(viewModel.data?.current?.vis_km ?? 0) km"
                                )
                                Spacer()
                                AboutWeatherView(
                                    title: "HUMIDITY",
                                    details:
                                        "\(viewModel.data?.current?.humidity ?? 0)%"
                                )
                            }.padding(.bottom, 20)

                            HStack {
                                AboutWeatherView(
                                    title: "FEELS LIKE",
                                    details:
                                        "\(viewModel.data?.current?.feelslike_c ?? 0)°"
                                )
                                Spacer()
                                AboutWeatherView(
                                    title: "PRESSURE",
                                    details:
                                        "\(viewModel.data?.current?.pressure_in ?? 0)"
                                )
                            }

                        }
                        .padding(30)
                        .background(.primary.opacity(0.4))
                        .cornerRadius(30)

                        Spacer()
                    }
                }

            }
            .preferredColorScheme(viewModel.isDay ? .light : .dark)
        }
    }
}

#Preview {
    WeatherCastView()
}
