//
//  IntegrationView.swift
//  WeatherSure
//
//  Created by Pooja Panirwala on 2023-03-26.
//

import SwiftUI

struct IntegrationView: View {
    var body: some View {
        ZStack {
                Color(red: 0.902, green: 0.890, blue: 0.851)
                    .ignoresSafeArea(.all)
                Text("Integration Steps")
                    .foregroundColor(Color.brown)
                    .font(.system(size: 26, weight: .bold))
                    .offset(y: -UIScreen.main.bounds.height / 3)
                }

    }
}

struct IntegrationView_Previews: PreviewProvider {
    static var previews: some View {
        IntegrationView()
    }
}
