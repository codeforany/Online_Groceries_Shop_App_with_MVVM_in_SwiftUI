//
//  ForgotPasswordView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 16/08/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var forgotVM = ForgotPasswordViewModel.shared;
    
    
    var body: some View {
        ZStack {
            Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            
            VStack{
                
                
                
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom, .screenWidth * 0.1)
                
                
                Text("Forgot Password")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your emails")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField( title: "Email", placholder: "Enter your email address", txt: $forgotVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                
                
                
                RoundButton(title: "Submit") {
                    forgotVM.serviceCallRequest()
                }
                .padding(.bottom, .screenWidth * 0.05)
                
                
                
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            
            VStack {
                    
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()

                }
                
                Spacer()
                
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
            
            
        }
        .alert(isPresented: $forgotVM.showError) {
                
            Alert(title: Text(Globs.AppName), message: Text( forgotVM.errorMessage ), dismissButton: .default(Text("Ok")))
        }
        .background( NavigationLink(destination: OTPView(), isActive: $forgotVM.showVerify,  label: {
            EmptyView()
        }) )
        .background( NavigationLink(destination: ForgotPasswordSetView(), isActive: $forgotVM.showSetPassword,  label: {
            EmptyView()
        }) )
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ForgotPasswordView()
        }

        
    }
}
