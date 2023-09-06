//
//  PromoCodeModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 11/08/23.
//

import SwiftUI

struct PromoCodeModel: Identifiable, Equatable {
    
    var id: Int = 0
    var type: Int = 0
    
    var title: String = ""
    var code: String = ""
    var description: String = ""
    var startDate: Date = Date()
    var endDate: Date = Date()
    var minOrderAmount: Double = 0.0
    var maxDiscountAmount: Double = 0.0
    var offerPrice: Double = 0.0
    
    
    
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "promo_code_id") as? Int ?? 0
        self.title = dict.value(forKey: "title") as? String ?? ""
        self.code = dict.value(forKey: "code") as? String ?? ""
        self.description = dict.value(forKey: "description") as? String ?? ""
        self.startDate = (dict.value(forKey: "start_date") as? String ?? "").stringDateToDate() ?? Date()
        self.endDate = (dict.value(forKey: "end_date") as? String ?? "").stringDateToDate() ?? Date()
        self.type = dict.value(forKey: "type") as? Int ?? 0
        self.minOrderAmount = dict.value(forKey: "min_order_amount") as? Double ?? 0
        self.maxDiscountAmount = dict.value(forKey: "max_discount_amount") as? Double ?? 0
        self.offerPrice = dict.value(forKey: "offer_price") as? Double ?? 0
       
    }
    
    static func == (lhs: PromoCodeModel, rhs: PromoCodeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
