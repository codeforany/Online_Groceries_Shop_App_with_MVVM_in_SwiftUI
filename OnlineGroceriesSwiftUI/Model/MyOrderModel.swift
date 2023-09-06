//
//  MyOrderModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 14/08/23.
//

import SwiftUI

struct MyOrderModel:  Identifiable, Equatable {
    var id: Int = 0
    var cartId: Int = 0
    var totalPrice: Double = 0
    var userPayPrice: Double?
    var discountPrice: Double?
    var deliverPrice: Double?
    var deliverType: Int = 0
    var paymentType: Int = 0
    var paymentStatus: Int = 0
    var orderStatus: Int = 0
    var status: Int = 0
    var names: String = ""
    var userName: String = ""
    var phone: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var postalCode: String = ""
    var images: [String] = []
  
    var createdDate: Date = Date()
    

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "order_id") as? Int ?? 0
        
        self.cartId = dict.value(forKey: "cart_id") as? Int ?? 0
        
        self.totalPrice = dict.value(forKey: "total_price") as? Double ?? 0.0
        self.userPayPrice = dict.value(forKey: "user_pay_price") as? Double ?? 0.0
        self.discountPrice = dict.value(forKey: "discount_price") as? Double ?? 0.0
        self.deliverPrice = dict.value(forKey: "deliver_price") as? Double ?? 0.0
        
        self.deliverType = dict.value(forKey: "deliver_type") as? Int ?? 0
        self.paymentType = dict.value(forKey: "payment_type") as? Int ?? 0
        self.paymentStatus = dict.value(forKey: "payment_status") as? Int ?? 0
        self.orderStatus = dict.value(forKey: "order_status") as? Int ?? 0
        self.status = dict.value(forKey: "status") as? Int ?? 0
        
        
        self.names = dict.value(forKey: "names") as? String ?? ""
        self.userName = dict.value(forKey: "user_name") as? String ?? ""
        self.phone = dict.value(forKey: "phone") as? String ?? ""
        self.address = dict.value(forKey: "address") as? String ?? ""
        self.city = dict.value(forKey: "city") as? String ?? ""
        self.state = dict.value(forKey: "state") as? String ?? ""
        self.postalCode = dict.value(forKey: "postal_code") as? String ?? ""
        
        self.images = (dict.value(forKey: "images") as? String ?? "").components(separatedBy: ",")
        self.createdDate = (dict.value(forKey: "created_date") as? String ?? "").stringDateToDate() ?? Date()
    }
    
    static func == (lhs: MyOrderModel, rhs: MyOrderModel) -> Bool {
        return lhs.id == rhs.id
    }
}
