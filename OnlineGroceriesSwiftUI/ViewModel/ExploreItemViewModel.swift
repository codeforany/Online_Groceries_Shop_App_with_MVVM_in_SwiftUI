//
//  ExploreItemViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 07/08/23.
//

import SwiftUI

class ExploreItemViewModel: ObservableObject
{
    @Published var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    
    init(catObj: ExploreCategoryModel) {
        self.cObj = catObj
        
        serviceCallList()
    }
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: ["cat_id": self.cObj.id ], path: Globs.SV_EXPLORE_ITEMS_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
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
