//
//  ContentView.swift
//  WeatherSure
//
//  Created by Jagtar Singh on 2023-03-16.
//

import SwiftUI
import Firebase

struct AuthCreds: View {
    @State private var isSignupFormLoaded = false
    //@State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var signupAlert = false
    @State private var showAlert = false
        @State private var alertMessage = ""
   // @State var showForgotPassword = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 0.902, green: 0.890, blue: 0.851)
                    .ignoresSafeArea(.all)
                Image("loginlogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .offset(y: -UIScreen.main.bounds.height / 3.5)
                
                VStack{
                    HStack{
                        Button("Login") {
                            self.isSignupFormLoaded = false
                        }
                        .padding()
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(self.isSignupFormLoaded ? Color.gray : Color.yellow)
                        //.foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .offset(y: UIScreen.main.bounds.height / 15)
                        Image("dash")
                            .padding(.horizontal)
                            .offset(y: UIScreen.main.bounds.height / 15)
                        Button("Signup") {
                            self.isSignupFormLoaded = true
                        }
                        .padding()
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(self.isSignupFormLoaded ? Color.yellow : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        .padding(.horizontal)
                        .offset(y: UIScreen.main.bounds.height / 15)
                    }
                                
                                if isSignupFormLoaded {
                                    
                                    TextField("Email", text: $email)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                        .offset(y: UIScreen.main.bounds.height / 20)
                                    
                                    SecureField("Password", text: $password)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .offset(y: UIScreen.main.bounds.height / 20)
                                    
                                    Button("Sign Up") {
                                        Auth.auth().createUser(withEmail: email, password: password){
                                            result, error in
                                            if error != nil {
                                                        print(error!.localizedDescription)
                                                    } else {
                                                        self.signupAlert = true // set state variable to true to show the alert
                                                    }
                                        }
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(30)
                                    .padding(.horizontal)
                                    .offset(y: UIScreen.main.bounds.height / 10)
                                    .alert(isPresented: $signupAlert) {
                                        Alert(title: Text("Sign Up Successful"), message: Text("You have successfully signed up!"), dismissButton: .default(Text("OK")))}
                                    
                                } else {
                                    TextField("Email", text: $email)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                        .offset(y: UIScreen.main.bounds.height / 20)
                                    
                                    SecureField("Password", text: $password)
                                        .padding()
                                        .background(Color.white)
                                    
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .offset(y: UIScreen.main.bounds.height / 20)
                                    
                                    
                                    Button("Forgot password?") {
                                        Auth.auth().sendPasswordReset(withEmail: email) { error in
                                                            if let error = error {
                                                                alertMessage = error.localizedDescription
                                                            } else {
                                                                alertMessage = "Password reset email sent successfully!"
                                                            }
                                                            showAlert = true
                                                        }
                                        
                                    }
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 19, weight: .bold))
                                    .offset(y: UIScreen.main.bounds.height / 30)
                                    .alert(isPresented: $showAlert) {
                                               Alert(title: Text(alertMessage))
                                           }

                                    
                                    Button("Log In") {

                                        
                                        Auth.auth().signIn(withEmail: email, password: password) { result, error in
                                                if error != nil {
                                                    print(error!.localizedDescription)
                                                } else {
                                                    let profileView = CoreView()
                                                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: profileView)
                                                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                                                }
                                            }
                                        
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(30)
                                    .padding(.horizontal)
                                    .offset(y: UIScreen.main.bounds.height / 10)
                                }
                            }
            }
        }
       
    }
}

struct AuthCreds_Previews: PreviewProvider {
    static var previews: some View {
        AuthCreds()
    }
}
