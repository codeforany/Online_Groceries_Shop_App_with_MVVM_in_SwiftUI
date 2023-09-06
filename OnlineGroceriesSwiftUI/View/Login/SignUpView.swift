//
//  SignUpView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 02/08/23.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView {
                VStack{
                    
                    
                    
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("Enter your credentials to continue")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    
                    LineTextField( title: "Username", placholder: "Enter your username", txt: $mainVM.txtUsername)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField( title: "Email", placholder: "Enter your email address", txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField( title: "Password", placholder: "Enter your password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.04)
                    
                    VStack {
                        Text("By continuing you agree to our")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            
                            Text("Terms of Service")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                                
                            
                            Text(" and ")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                                
                            
                            Text("Privacy Policy.")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                        }
                        .padding(.bottom, .screenWidth * 0.02)
                    }
                    
                    
                    RoundButton(title: "Sing Up") {
                        mainVM.serviceCallSignUp()
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        HStack{
                            Text("Alredy have an account?")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryText)
                            
                            Text("Sign In")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryApp)
                        }
                    }

                   
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
            
            
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()

                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage) , dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
