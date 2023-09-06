//
//  ForgotPasswordViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 16/08/23.
//

import SwiftUI

class ForgotPasswordViewModel: ObservableObject
{
    static var shared: ForgotPasswordViewModel = ForgotPasswordViewModel()
    
    
    @Published var txtEmail: String = ""
    @Published var txtResetCode: String = ""
    
    @Published var txtNewPassword: String = ""
    @Published var txtConfirmPassword: String = ""
    
    @Published var isNewPassword: Bool = false
    @Published var isConfirmPassword: Bool = false
    
    @Published var showVerify: Bool = false
    @Published var showSetPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
   
    var resetObj: NSDictionary?
    
   
    
    
    
    //MARK: ServiceCall
    func serviceCallRequest(){
        
        if(!txtEmail.isValidEmail) {
            self.errorMessage = "Please enter valid email address"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["email": txtEmail ], path: Globs.SV_FORGOT_PASSWORD_REQUEST, isToken: false ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.showVerify = true
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func serviceCallVerify(){
        
        if(txtResetCode.count != 4) {
            self.errorMessage = "Please enter valid otp"
            self.showError = true
            return
        }
        ServiceCall.post(parameter: ["email": txtEmail, "reset_code": txtResetCode ], path: Globs.SV_FORGOT_PASSWORD_VERIFY, isToken: false ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.resetObj = response.value(forKey: KKey.payload) as? NSDictionary
                    self.showSetPassword = true
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func serviceCallSetPassword(){
        
        if(txtNewPassword.count < 6) {
            self.errorMessage = "Please enter new password minimum 6 character"
            self.showError = true
            return
        }
        
        if(txtNewPassword != txtConfirmPassword) {
            self.errorMessage = "password not match"
            self.showError = true
            return
        }
        
        
        ServiceCall.post(parameter: ["user_id": self.resetObj?.value(forKey: "user_id") ?? "", "reset_code":self.resetObj?.value(forKey: "reset_code") ?? "" , "new_password": txtNewPassword], path: Globs.SV_FORGOT_PASSWORD_SET_PASSWORD, isToken: false ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.txtEmail = ""
                    self.txtConfirmPassword = ""
                    self.txtNewPassword = ""
                    
                    self.showSetPassword = false
                    
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
}

