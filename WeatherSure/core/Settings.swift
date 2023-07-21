////
////  Settings.swift
////  WeatherSure
////
////  Created by Jagtar Singh matharu on 2023-03-24.
////
//import SwiftUI
//
//struct SettingsView: View {
//    @State private var selectedTime = Date()
//    @State private var showToggle = true
//
//    // View model for the settings view
//    @State var backgroundColor = Color.blue
//    @State var selectedTemperatureUnit = 0
//    @State var temperatureUnits = ["Celsius", "Fahrenheit"]
//    @State var showHourlyTemperature = true
//    @State var showDailyTemperatureForToday = true
//    @State var showDailyTemperatureForTomorrow = true
//
//    var body: some View {
////        NavigationView {
////            Form {
////                Section(header: Text("Appearance")) {
////                    VStack(alignment: .leading, spacing: 10) {
////                        Text("Background color")
////                        ColorPicker("", selection: $backgroundColor)
////                            .frame(width: 100, height: 50)
////                    }
////                }
////
////                Section(header: Text("Saved locations")) {
////                    Button(action: { /* remove saved locations */ }) {
////                        Text("Remove all saved locations")
////                            .foregroundColor(.red)
////                    }
////                }
////
////                Section(header: Text("Temperature units")) {
////                    HStack {
////                        ForEach(0..<2) { index in
////                            Button(action: {
////                                selectedTemperatureUnit = index
////                            }) {
////                                Text(temperatureUnits[index])
////                                    .padding(.horizontal, 20)
////                                    .padding(.vertical, 8)
////                                    .background(selectedTemperatureUnit == index ? Color.blue : Color.gray)
////                                    .foregroundColor(.white)
////                                    .cornerRadius(8)
////                            }
////                        }
////                    }
////                }
////
////
////                Section(header: Text("Hourly temperature")) {
////                    Toggle("Show hourly temperature", isOn: $showHourlyTemperature)
////                }
////
////                Section(header: Text("Daily temperature")) {
////                    VStack(alignment: .leading, spacing: 10) {
////                        Text("Show daily temperature for")
////                        HStack {
////                            Toggle("Today", isOn: $showDailyTemperatureForToday)
////                            Spacer()
////                            Toggle("Tomorrow", isOn: $showDailyTemperatureForTomorrow)
////                        }
////                    }
////                }
////            }
////            .navigationBarTitle("Settings")
////        }
//
//        ZStack {
//            Color(red: 0.902, green: 0.890, blue: 0.851)
//                .ignoresSafeArea(.all)
//            Text("Settings")
//            .foregroundColor(Color.brown)
//            .font(.system(size: 24, weight: .bold))
//            .offset(y: -UIScreen.main.bounds.height / 3)
////                        .offset(x:-UIScreen.main.bounds.width / 3)
//            VStack {
//                Toggle("Send Notification",isOn: $showToggle)
//                    .font(.system(size: 18, weight: .medium))
//                    .offset(y: -UIScreen.main.bounds.height / 4)
//                    .padding()
//            }
//            VStack {
//                    Text("Notification Time")
//                    .font(.system(size: 18, weight: .medium))
//                    .offset(y: -UIScreen.main.bounds.height / 8)
//                    .offset(x:-UIScreen.main.bounds.width / 3.6)
//
//                        DatePicker(
//                            "",
//                            selection: $selectedTime,
//                            displayedComponents: .hourAndMinute
//                        )
//                        .datePickerStyle(GraphicalDatePickerStyle())
//                        .font(.system(size: 18, weight: .medium))
//                        .offset(y: -UIScreen.main.bounds.height / 5)
//                        .padding()
//                    }
//            VStack {
//                Text("About WeatherSure")
//                    .foregroundColor(Color.brown)
//                    .font(.system(size: 20, weight: .bold))
//                    .offset(y: -UIScreen.main.bounds.height / 9)
//                    .offset(x:-UIScreen.main.bounds.width / 4.4)
//                    .padding()
//            }
//            VStack {
//                Text("WeatherSure is a Weather Application. The purpose of the project is to develop an application in which users can view current temperature and other weather- related details of a particular location.")
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.leading)
//                    .padding()
//                    .offset(y: UIScreen.main.bounds.height / 80)
//            }
//            VStack {
//                NavigationLink("Personalize your notifications here", destination: PersonalizationView())
//                    .foregroundColor(Color.blue)
//                    .font(.system(size: 18, weight: .medium))
//                    .offset(y: UIScreen.main.bounds.height / 8)
//                    .offset(x:-UIScreen.main.bounds.width / 11)
//                    .padding()
//
//            }
//            VStack {
//                NavigationLink("How to Integrate WeatherApp to other apps?", destination: IntegrationView())
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.leading)
//                    .foregroundColor(Color.blue)
//                    .font(.system(size: 18, weight: .medium))
//                    .offset(y: UIScreen.main.bounds.height / 6)
//                    .offset(x:UIScreen.main.bounds.width / 70)
////                                .padding()
//            }
//            VStack {
//                Text("Contact Us")
//                    .foregroundColor(Color.brown)
//                    .font(.system(size: 20, weight: .bold))
//                    .offset(y: UIScreen.main.bounds.height / 3.5)
//                    .offset(x:-UIScreen.main.bounds.width / 3.1)
//                    .padding()
//                Text("contactus@weathersure.com")
//                    .font(.system(size: 16, weight: .semibold))
//                    .offset(y: UIScreen.main.bounds.height / 4)
//                    .offset(x:-UIScreen.main.bounds.width / 5.8)
//                    .padding()
//            }
//            VStack {
//                NavigationLink("We appreciate your feedback!", destination: FeedbackView())
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.leading)
//                    .foregroundColor(Color.blue)
//                    .font(.system(size: 18, weight: .medium))
//                    .offset(y: UIScreen.main.bounds.height / 3)
//                    .offset(x:-UIScreen.main.bounds.width / 7)
////                                .padding()
//            }
//        }
//
//    }
//}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
