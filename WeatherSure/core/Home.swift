//
//  Home.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-04-19.
//
import SwiftUI
import CoreLocation

struct HView: View {
    @State var weatherInfo: WeatherInfo=WeatherInfo(temperature: "-°C", condition: "---", location: "Please Enter location")
    @ObservedObject var w = WeatherViewModel()
    @State private var search = ""
    @State var location = "Toronto"
    @State var isViewHidden = true
    @State var selection: String? = nil
    @State private var latitude: Double = 0
    @State private var longitude: Double = 0
    //data
    @State private var D_temp_max: Double = 0
    @State private var D_temp_min: Double = 0
    @State private var D_sunrise: String = ""
    @State private var D_sunset: String = ""
    @State private var D_showers_sum: Int = 0
    @State private var D_snowfall_sum: Int = 0
    //units
    @State private var D_u_temp_max: String = ""
    @State private var D_u_temp_min: String = ""
    @State private var D_u_sunrise: String = ""
    @State private var D_u_sunset: String = ""
    @State private var D_u_date: String = ""
    @State private var D_u_showers_sum: String = ""
    @State private var D_u_snowfall_sum: String = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    Text("LOCATIONS")
                        .foregroundColor(Color.brown)
                        .font(.system(size: 26, weight: .bold))
                    
                    HStack{
                        TextField("Search here", text: $search)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Button(action: {
                            location=search
                           getLocation()
                            
                        }) {
                            Text("search")
                                .foregroundColor(.white) // set the font color
                                .padding() // add some padding to the text
                        }
                        .background(Color.brown)
                        .frame(height: 40)
                        .cornerRadius(10)
                    }
                }.padding(.bottom,600)
                
                if !isViewHidden {
                    VStack(alignment: .center, spacing: 30) {
                        Spacer()
                        NavigationLink(destination: HourlyWeatherView(w:w)) {
                            Text(location).font(.title)
                        }
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.gray)
                        HStack{
                            Text(String(D_temp_max).suffix(4))
                                .font(.system(size: 70, weight: .thin))
                            Text("°C max")
                            Text(String(D_temp_min).suffix(4))
                                .font(.system(size: 70, weight: .thin))
                            Text("°C min")
                        }
                        Text(weatherInfo.condition)
                            .font(.system(size: 30, weight: .medium))
                            .foregroundColor(.gray)
                        Spacer()
                    }.padding(.bottom,200)
                    .animation(.easeInOut(duration: 2), value: 1)
                    .transition(.slide)
                }
                else
                {
                    VStack(alignment: .center, spacing: 30) {
                        
                        
                        Spacer()
                        Text(weatherInfo.location)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.gray)
                        Text(weatherInfo.temperature)
                            .font(.system(size: 70, weight: .thin))
                        Text(weatherInfo.condition)
                            .font(.system(size: 30, weight: .medium))
                            .foregroundColor(.gray)
                        Spacer()
                    }.padding(.bottom,200)
                        .animation(.easeInOut(duration: 2), value: 1)
                        .transition(.slide)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Conditions expected from 2:00 PM to 6:00 PM")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.bottom,20)
                    HStack(spacing: 10) {
                        ForEach(0..<5) { index in
                            VStack(spacing: 5) {
                                Text("\(index + 1):00 PM")
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                                Image(systemName: "thermometer.sun.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                Text("26°C")
                                    .font(.caption)
                            }
                        }
                    }
                }.frame(width: 300,height: 200)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(30)
                    .padding(.top,320)
            }
        }
    }
    
    func getLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(search) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                latitude = (location.coordinate.latitude * 100).rounded() / 100
                longitude = (location.coordinate.longitude * 100).rounded() / 100
                print("latitude",latitude)
                print("longitude",longitude)
                w.latitude=latitude
                w.longitude=longitude
                
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    w.fetchWeatherData()
                    D_temp_max=w.daily!.temperature_2m_max.first!
                    D_temp_min=w.daily!.temperature_2m_min.first!
                    D_sunset=w.daily!.sunset.first!
                    D_sunrise=w.daily!.sunrise.first!
                    D_showers_sum=w.daily!.showers_sum.first!
                    D_snowfall_sum=w.daily!.snowfall_sum.first!

                    D_u_temp_max=w.dailyUnits!.temperature_2m_max
                    D_u_temp_min=w.dailyUnits!.temperature_2m_min
                    D_u_sunset=w.dailyUnits!.sunset
                    D_u_sunrise=w.dailyUnits!.sunrise
                    D_u_showers_sum=w.dailyUnits!.showers_sum
                    D_u_snowfall_sum=w.dailyUnits!.snowfall_sum
                    isViewHidden=false

                    print("w.daily!.temperature_2m_max.first!",w.daily!.temperature_2m_max.first!)
                }
            }
        }
    }
}

struct HView_Previews: PreviewProvider {
    static var previews: some View {
        HView()
    }
}
