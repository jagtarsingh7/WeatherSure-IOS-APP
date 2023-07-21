//  TempDetailsView.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-03-24.
//
import SwiftUI

struct WeatherView2: View {
    
    @State var weatherInfo: WeatherInfo=WeatherInfo(temperature: "26°C", condition: "Sunny", location: "San Francisco, CA")
    
    var body: some View {
        ZStack{
              
                Image("weathersure")
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .offset(y: -UIScreen.main.bounds.height / 2.6)
                    .padding(.top,10)
            
            
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
            
            
                .onAppear {
                    // Simulate weather data update
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        weatherInfo.temperature = "32°C"
                        weatherInfo.condition = "Partly Cloudy"
                        weatherInfo.location = "Los Angeles, CA"
                    }
                }
                .animation(.easeInOut(duration: 2), value: 1)
                .transition(.slide)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Cloudy conditions expected from 2:00 PM to 6:00 PM")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom,20)
                HStack(spacing: 10) {
                    ForEach(0..<5) { index in
                        VStack(spacing: 5) {
                            Text("\(index + 1):00 PM")
                                .foregroundColor(.gray)
                                .font(.footnote)
                            Image(systemName: "cloud.sun.fill")
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


struct ContentView_Previews3: PreviewProvider {
    static var previews: some View {
        WeatherView2()
    }
}
