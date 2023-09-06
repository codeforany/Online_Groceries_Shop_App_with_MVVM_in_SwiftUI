//
//  Globs.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 01/08/23.
//

import SwiftUI

struct Globs {
    static let AppName = "Online Groceries"
    
    static let BASE_URL = "http://localhost:3001/api/app/"
    
    static let userPayload = "user_payload"
    static let userLogin = "user_login"
    
    static let SV_LOGIN = BASE_URL + "login"
    static let SV_SIGN_UP = BASE_URL + "sign_up"
    static let SV_HOME = BASE_URL + "home"
    static let SV_PRODUCT_DETAIL = BASE_URL + "product_detail"
    static let SV_ADD_REMOVE_FAVORITE = BASE_URL + "add_remove_favorite"
    static let SV_FAVORITE_LIST = BASE_URL + "favorite_list"
    
    static let SV_ADD_CART = BASE_URL + "add_to_cart"
    static let SV_UPDATE_CART = BASE_URL + "update_cart"
    static let SV_REMOVE_CART = BASE_URL + "remove_cart"
    static let SV_CART_LIST = BASE_URL + "cart_list"
    static let SV_ORDER_PLACE = BASE_URL + "order_place"
    
    static let SV_ADD_ADDRESS = BASE_URL + "add_delivery_address"
    static let SV_UPDATE_ADDRESS = BASE_URL + "update_delivery_address"
    static let SV_REMOVE_ADDRESS = BASE_URL + "delete_delivery_address"
    static let SV_ADDRESS_LIST = BASE_URL + "delivery_address"
    
    static let SV_MY_ORDERS_LIST = BASE_URL + "my_order"
    static let SV_MY_ORDERS_DETAIL = BASE_URL + "my_order_detail"
    
    static let SV_ADD_PAYMENT_METHOD = BASE_URL + "add_payment_method"
    static let SV_REMOVE_PAYMENT_METHOD = BASE_URL + "remove_payment_method"
    static let SV_PAYMENT_METHOD_LIST = BASE_URL + "payment_method"
    
    static let SV_PROMO_CODE_LIST = BASE_URL + "promo_code_list"
    
    static let SV_EXPLORE_LIST = BASE_URL + "explore_category_list"
    static let SV_EXPLORE_ITEMS_LIST = BASE_URL + "explore_category_items_list"
    
    static let SV_NOTIFICATION_LIST = BASE_URL + "notification_list"
    static let SV_NOTIFICATION_READ_ALL = BASE_URL + "notification_read_all"
    
    static let SV_UPDATE_PROFILE = BASE_URL + "update_profile"
    static let SV_CHANGE_PASSWORD = BASE_URL + "change_password"
    
    static let SV_FORGOT_PASSWORD_REQUEST = BASE_URL + "forgot_password_request"
    static let SV_FORGOT_PASSWORD_VERIFY = BASE_URL + "forgot_password_verify"
    static let SV_FORGOT_PASSWORD_SET_PASSWORD = BASE_URL + "forgot_password_set_password"
    
}

struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}

class Utils {
    class func UDSET(data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func UDValue( key: String) -> Any {
       return UserDefaults.standard.value(forKey: key) as Any
    }
    
    class func UDValueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    
    class func UDValueTrueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    
    class func UDRemove( key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}

