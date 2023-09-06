//
//  OnlineGroceriesSwiftUIApp.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 30/07/23.
//

import SwiftUI

@main
struct OnlineGroceriesSwiftUIApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                
                if mainVM.isUserLogin {
                    MainTabView()
                }else{
                    WelcomeView()
                }
            }
            
        }
    }
}
