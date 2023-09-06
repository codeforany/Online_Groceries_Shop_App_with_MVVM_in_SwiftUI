//
//  AccountRow.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 09/08/23.
//

import SwiftUI

struct AccountRow: View {
    @State var title: String = "Title"
    @State var icon: String = "a_order"
    
    var body: some View {
        VStack{
            
            HStack(spacing: 15){
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20 )
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15 )
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            Divider()
        }
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow()
    }
}
