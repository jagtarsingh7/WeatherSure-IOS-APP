//
//  HomeView.swift
//  WeatherSure
//
//  Created by Pooja Panirwala on 2023-03-22.
//

import SwiftUI

struct CoreView: View {
    var body: some View {
        ZStack {
            
            TabView {
                CurrentWeather()
                .tabItem {
                    Image(systemName: "sun.max.fill")
                    Text("Current")
                }
                HView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                                 
                SavedLocations()
                    .tabItem {
                        Image(systemName: "location")
                        Text("Saved Locations")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
//                SettingsView()
//                    .tabItem {
//                        Image(systemName: "gear")
//                        Text("Settings")
//                    }
              
                    
            }
            .accentColor(Color.brown)
            .foregroundColor(Color.black)
            .edgesIgnoringSafeArea(.top) // Ignore the safe area at the top
        }
    }
  
   
}
