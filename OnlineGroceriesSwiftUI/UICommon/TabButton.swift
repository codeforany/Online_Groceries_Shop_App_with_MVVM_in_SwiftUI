//
//  TabButton.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 03/08/23.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "store_tab"
    var isSelect: Bool = false
    var didSelect: (()->())
    
    var body: some View {
        Button {
            debugPrint("Tab Button Tap")
            didSelect()
        } label: {
            VStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                
                    
            }
        }
        .foregroundColor(isSelect ? .primaryApp : .primaryText )
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton {
            print("Test")
        }
    }
}
