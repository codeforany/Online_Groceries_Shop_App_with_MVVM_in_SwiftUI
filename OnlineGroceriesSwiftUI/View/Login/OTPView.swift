//
//  OTPView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 16/08/23.
//

import SwiftUI

struct OTPView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var forgotVM = ForgotPasswordViewModel.shared;
    
    
    var body: some View {
        ZStack {
            Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            
            VStack{
                
                Text("Enter your 4-digit code")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                
                LineTextField( title: "Code", placholder: "- - - -", txt: $forgotVM.txtResetCode, keyboardType: .phonePad)
                    .padding(.bottom, .screenWidth * 0.07)
                
                
                HStack {
                    Button {
                        forgotVM.serviceCallRequest()
                    } label: {
                        Text("Resend Code")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryApp)
                            
                    }
                    
                    Spacer()
                    
                    Button {
                        forgotVM.serviceCallVerify()
                    } label: {
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(15)
                    }
                    .foregroundColor(.white)
                    .background(Color.primaryApp)
                    .cornerRadius(30)
                    
                }
                
                
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
       
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
