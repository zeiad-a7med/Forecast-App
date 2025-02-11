//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var data: ForcastResponse?
    @Published var isLoading: Bool = true
    @Published var isDay: Bool = true
    init() {
        getWhetherData()
    }
    func getWhetherData() {
        isLoading = true
        WeatherService.fetchDataFromApi { (result) in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.data = result
                self.isDay = self.data?.current?.is_day == 1
            }
        }
    }
}
