//
//  UserModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 02/08/23.
//

import SwiftUI

struct UserModel: Identifiable, Equatable {
    
    var id: Int = 0
    var username: String = ""
    var name: String = ""
    var email: String = ""
    var mobile: String = ""
    var mobileCode: String = ""
    var authToken: String = ""
    
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "user_id") as? Int ?? 0
        self.username = dict.value(forKey: "username") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.email = dict.value(forKey: "email") as? String ?? ""
        self.mobile = dict.value(forKey: "mobile") as? String ?? ""
        self.mobileCode = dict.value(forKey: "mobile_code") as? String ?? ""
        self.authToken = dict.value(forKey: "auth_token") as? String ?? ""
    }
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
}

