//
//  MyOrderDetailViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 15/08/23.
//

import SwiftUI

class MyOrderDetailViewModel: ObservableObject {
    @Published var pObj: MyOrderModel = MyOrderModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var listArr: [OrderItemModel] = []
    
    
    init(prodObj: MyOrderModel) {
        self.pObj = prodObj
        serviceCallDetail()
    }
    
    //MARK: ServiceCall
    
    func serviceCallDetail(){
        ServiceCall.post(parameter: ["order_id": self.pObj.id ], path: Globs.SV_MY_ORDERS_DETAIL, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        
                        self.pObj = MyOrderModel(dict: payloadObj)
                        self.listArr = (payloadObj.value(forKey: "cart_list") as? NSArray ?? []).map({ obj in
                            
                            print(obj)
                            return OrderItemModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                    
                    
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
