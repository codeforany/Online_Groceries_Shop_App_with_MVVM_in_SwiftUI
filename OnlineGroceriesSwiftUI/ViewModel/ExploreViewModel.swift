//
//  ExploreViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 06/08/23.
//

import SwiftUI

class ExploreViewModel: ObservableObject
{
    static var shared: ExploreViewModel = ExploreViewModel()
    
    @Published var txtSearch: String = ""
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ExploreCategoryModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    
    //MARK: ServiceCall
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_EXPLORE_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        
                        return ExploreCategoryModel(dict: obj as? NSDictionary ?? [:])
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
