//
//  ProfileView.swift
//  WeatherSure
//
//  Created by Sakshi Patel on 2023-03-22.
//

import SwiftUI

struct ProfileView: View {
    @State var showFeedbackForm = false
    @State var showEditForm = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.902, green: 0.890, blue: 0.851)
                    .ignoresSafeArea(.all)
                Image("weathersure")
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .offset(y: -UIScreen.main.bounds.height / 2.6)
                
                VStack{
                   
                    HStack{
                        Button(action: {
                                showEditForm = true
                            }) {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.brown)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.horizontal)
                            .offset(y: -UIScreen.main.bounds.height / 24)
                    }
                    NavigationLink(destination: EditView(), isActive: $showEditForm) {
                                            EmptyView()
                                }
                    
                    HStack{
                                VStack (spacing: 10){
                                    Text("Activity/ Daily Usage:")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("90%")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 350, height: 100)
                                .background(Color.gray.opacity(0.7))
                                .cornerRadius(10)
                                .offset(y: -UIScreen.main.bounds.height / 35)
                    }
                    HStack{
                                VStack (spacing: 10){
                                    Text("Contact Us:")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("+1 111-111-1111 (Tollfree)")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                    Text("helpdesk@weathersure.com")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                    
                                    Text("111 abc street, xyz, CA, H12Q23 ")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 350, height: 133)
                                .background(Color.gray.opacity(0.7))
                                .cornerRadius(10)
                                .offset(y: -UIScreen.main.bounds.height / 31)
                    }
                }
                
                HStack{
                    Button("FEEDBACK FORM") {
                        showFeedbackForm = true
                    }
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.brown)
                    .font(.system(size: 20, weight: .bold))
                    .cornerRadius(30)
                    .padding(.horizontal)
                    .offset(y: UIScreen.main.bounds.height / 2.9)
                }
                NavigationLink(destination: FeedbackView(), isActive: $showFeedbackForm) {
                                        EmptyView()
                            }
                                                    
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
