//
//  NotificationModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 15/08/23.
//

import SwiftUI

struct NotificationModel: Identifiable, Equatable {
    
    var id: Int = 0
    var refId: Int = 0
    var isRead: Int = 0
    var notificationType: Int = 0
    var title: String = ""
    var message: String = ""
    var createdDate: Date = Date()
    
    
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "notification_id") as? Int ?? 0
        self.refId = dict.value(forKey: "ref_id") as? Int ?? 0
        self.isRead = dict.value(forKey: "is_read") as? Int ?? 0
        self.notificationType = dict.value(forKey: "notification_type") as? Int ?? 0
        self.title = dict.value(forKey: "title") as? String ?? ""
        self.message = dict.value(forKey: "message") as? String ?? ""
        self.createdDate = (dict.value(forKey: "created_date") as? String ?? "").stringDateToDate() ?? Date()
    }
    
    static func == (lhs: NotificationModel, rhs: NotificationModel) -> Bool {
        return lhs.id == rhs.id
    }
}
