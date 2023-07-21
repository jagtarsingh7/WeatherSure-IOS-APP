import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var w :WeatherViewModel
    

    @State private var H_time: [String] = []

    @State private var H_temperature_2m: [Double] = []
    @State private var H_relativehumidity_2m: [Int] = []
    @State private var visibility_h: [Int] = []
    @State private var pressure_msl: [Double] = []

    @State private var uv_index: [Double] = []

    @State private var soil_temperature_0cm: [Double] = []

    @State private var windspeed_10m: [Double] = []
    var weatherData: [HourlyWeather] = []

    init(w:WeatherViewModel){
        self.w=w
        for i in 0..<24 {
        let hourlyWeather = HourlyWeather(time: w.hourly!.time[i], temperature: w.hourly!.temperature_2m[i], humidity: w.hourly!.relativehumidity_2m[i], pressure: w.hourly!.pressure_msl[i], visibility: w.hourly!.visibility[i], windSpeed: w.hourly!.windspeed_10m[i], soil_temperature: w.hourly!.soil_temperature_0cm[i], uv: w.hourly!.uv_index[i])
        weatherData.append(hourlyWeather)
                    
    }
        
        print("weatherData",weatherData)
    }
        
        // add more hourly weather data here
    
    var body: some View {
        
        VStack{
            Image(systemName: "cloud.sun.fill")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 100, height: 100)
                           .padding()
                           .foregroundColor(Color.accentColor)
            Text("Hourly Forecast")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom,170)
            if(!weatherData.isEmpty){
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(weatherData) { weather in
                            VStack(alignment: .center, spacing: 10) {
                                Text("\(String(weather.time.suffix(5)))")
                                    .font(.headline)
                                Image(systemName: "thermometer.sun.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("\(String(weather.temperature))°C")
                                    .font(.subheadline)
                                Text("Visibilty \(weather.visibility) m")
                                    .font(.footnote)
                                Divider()
                                HStack {
                                    Image(systemName: "wind")
                                    Text(String(weather.windSpeed).prefix(5)+"m")
                                }
                                HStack {
                                    Image(systemName: "sun.max.fill")
                                    Text(String(weather.uv).prefix(5)+"uv")
                                }
                                HStack {
                                    Image(systemName: "drop")
                                    Text("\(weather.humidity)%")
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom,150)
                    
                }
            }
        }
    }
}

