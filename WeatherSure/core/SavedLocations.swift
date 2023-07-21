//
//  SavedLocations.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-04-19.
//

import SwiftUI

struct SavedLocations: View {
    
    var body: some View {
        ZStack {
            Color(red: 0.902, green: 0.890, blue: 0.851)
                .ignoresSafeArea(.all)
            Text("Saved LOCATIONS")
            .foregroundColor(Color.brown)
            .font(.system(size: 24, weight: .bold))
            .offset(y: -UIScreen.main.bounds.height / 3)
//                        .offset(x:-UIScreen.main.bounds.width / 6)
            List {
                // Example location and temperature data
                HStack {
                    Text("New York")
                    Spacer()
                    Text("60°F")
                }
                .padding(.vertical)
                HStack {
                    Text("Los Angeles")
                    Spacer()
                    Text("70°F")
                }
                .padding(.vertical)
                HStack {
                    Text("Chicago")
                    Spacer()
                    Text("55°F")
                }
                .padding(.vertical)
            }
            .foregroundColor(Color.brown)
            .font(.system(size: 22, weight: .medium))
            .listStyle(PlainListStyle())
            .padding(.top, 50)
            .offset(y: UIScreen.main.bounds.height / 10)
            
        }
    }
}

struct SavedLocations_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocations()
    }
}
