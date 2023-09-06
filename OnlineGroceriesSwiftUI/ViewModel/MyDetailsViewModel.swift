//
//  MyDetailsViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 15/08/23.
//

import SwiftUI
import CountryPicker

class MyDetailsViewModel: ObservableObject
{
    static var shared: MyDetailsViewModel = MyDetailsViewModel()
    
    
    @Published var txtName: String = ""
    @Published var txtMobile: String = ""
    @Published var txtUsername: String = ""
    @Published var txtMobileCode: String = ""
    @Published var isShowPicker: Bool = false
    @Published var countryObj: Country? {
        didSet {
            if( countryObj != nil) {
                txtMobileCode = "+\(countryObj!.phoneCode)" 
            }
        }
    }
    
    
    @Published var txtCurrentPassword: String = ""
    @Published var txtNewPassword: String = ""
    @Published var txtConfirmPassword: String = ""
    
    @Published var isCurrentPassword: Bool = false
    @Published var isNewPassword: Bool = false
    @Published var isConfirmPassword: Bool = false
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [AddressModel] = []
    
    
    init() {
        setData()
    }
    
    func clearAll(){
        txtName = ""
        txtMobile = ""
        txtUsername = ""
        txtCurrentPassword = ""
        txtMobileCode = ""
        txtNewPassword = ""
        txtConfirmPassword = ""
    }
    
    func setData() {
        var userObj = MainViewModel.shared.userObj
        txtName = userObj.name
        txtMobile = userObj.mobile
        txtMobileCode = userObj.mobileCode
        txtUsername = userObj.username
        
        self.countryObj = Country(phoneCode: txtMobileCode.replacingOccurrences(of: "+", with: ""), isoCode: "IN")
    }
    
    
    
    //MARK: ServiceCall
    func serviceCallUpdate(){
        
        if(txtName.isEmpty) {
            self.errorMessage = "Please enter name"
            self.showError = true
            return
        }
        
        if(txtMobile.isEmpty) {
            self.errorMessage = "Please enter mobile number"
            self.showError = true
            return
        }
        
        if(txtUsername.isEmpty) {
            self.errorMessage = "Please enter username"
            self.showError = true
            return
        }
        
        
        
        ServiceCall.post(parameter: ["name": txtName, "mobile": txtMobile, "mobile_code": txtMobileCode, "username": txtUsername ], path: Globs.SV_UPDATE_PROFILE, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    
                    MainViewModel.shared.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                    
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
    
    func serviceCallChangePassword(){
        
        if(txtCurrentPassword.isEmpty) {
            self.errorMessage = "Please enter current password"
            self.showError = true
            return
        }
        
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
        
        
        ServiceCall.post(parameter: ["current_password": txtCurrentPassword, "new_password": txtNewPassword], path: Globs.SV_CHANGE_PASSWORD, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.txtConfirmPassword = ""
                    self.txtNewPassword = ""
                    self.txtCurrentPassword = ""
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
