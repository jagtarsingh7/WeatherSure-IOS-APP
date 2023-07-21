//
//  HourlyDataModel.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-03-24.
//

import SwiftUI
struct HourlyWeather: Identifiable {
    let id = UUID()
    let time: String
    let temperature: Double
    let humidity: Int
    let pressure: Double
    let visibility: Int
    let windSpeed: Double
    let soil_temperature: Double
    let uv: Double
}
