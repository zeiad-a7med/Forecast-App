//
//  AboutWeatheView.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import SwiftUI

struct AboutWeatherView: View {
    let title: String
    let details: String
    var body: some View {
        VStack{
            Text(title)
                .font(.system(size: 16))
                .padding(.bottom,10)
            Text(details)
                .font(.system(size: 40))
        }
    }
}

#Preview {
    AboutWeatherView(
        title: "HUMIDITY", details: "36%"
    )
}
