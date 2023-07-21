//
//  TempDetailsView.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-03-24.
//
import SwiftUI



struct TempTapBarView: View {
    
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            WeatherView2()
                .tabItem {
                    Image(systemName: "cloud.sun.fill")
                    Text("Weather")
                }.tag(0)
//            HourlyWeatherView()
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Hourly Weather")
//                }.tag(1)
            
        }
    }
}


struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        TempTapBarView()
    }
}
