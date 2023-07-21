//
//  WeatherApiData.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-04-19.
//

import SwiftUI

struct WeatherForecast : Decodable{
    let latitude, longitude, generationtime_ms: Double
    let utc_offset_seconds: Int
    let timezone, timezone_abbreviation: String
    let elevation: Double
    let hourly_units: HourlyUnits
    let hourly: Hourly
    let daily_units: DailyUnits
    let daily: Daily
}

// MARK: - Daily
struct Daily: Decodable {
    let time: [String]
    let weathercode: [Int]
    let temperature_2m_max, temperature_2m_min: [Double]
    let sunrise, sunset: [String]
    let showers_sum, snowfall_sum: [Int]
}

// MARK: - DailyUnits
struct DailyUnits : Decodable{
    let time, weathercode, temperature_2m_max, temperature_2m_min: String
    let sunrise, sunset, showers_sum, snowfall_sum: String
}

// MARK: - Hourly
struct Hourly : Decodable{
    let time: [String]
    let temperature_2m: [Double]
    let relativehumidity_2m, weathercode: [Int]
    let pressure_msl: [Double]
    let visibility: [Int]
    let windspeed_10m, soil_temperature_0cm, uv_index: [Double]
}

// MARK: - HourlyUnits
struct HourlyUnits: Decodable {
    let time, temperature_2m, relativehumidity_2m, weathercode: String
    let pressure_msl, visibility, windspeed_10m, soil_temperature_0cm: String
    let uv_index: String
}

class WeatherViewModel: ObservableObject {
    @Published var daily:Daily?
    @Published var dailyUnits:DailyUnits?
    @Published var hourly: Hourly?
    @Published var hourlyUnits: HourlyUnits?
    @Published var latitude:Double = 43.65;
    @Published var longitude:Double = -79.34;

    
    
    init() {
        fetchWeatherData()
    }
    func fetchWeatherData() {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&hourly=temperature_2m,relativehumidity_2m,weathercode,pressure_msl,visibility,windspeed_10m,soil_temperature_0cm,uv_index&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,showers_sum,snowfall_sum&forecast_days=1&timezone=America%2FNew_York") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(WeatherForecast.self, from: data)
                DispatchQueue.main.async {
                    self.daily = decodedData.daily
                    self.hourly = decodedData.hourly
                    self.dailyUnits=decodedData.daily_units
                    self.hourlyUnits=decodedData.hourly_units

                    print("function called",self.daily)


                }
            } catch {
                print("Decode error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

