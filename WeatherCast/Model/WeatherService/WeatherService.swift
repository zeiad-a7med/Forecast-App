//
//  WeatherService.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation

protocol WeatherServiceProtocol {
    static func fetchDataFromApi(
        complitionHandler: @escaping (ForcastResponse?) -> Void)
}

class WeatherService: WeatherServiceProtocol {
    static func fetchDataFromApi(
        complitionHandler: @escaping (ForcastResponse?) -> Void
    ) {
        guard
            let url = URL(
                string:
                    ApiEndpoint.baseUrl
            )
        else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let forcastResponse = try JSONDecoder().decode(
                    ForcastResponse.self, from: data)
                complitionHandler(forcastResponse)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
