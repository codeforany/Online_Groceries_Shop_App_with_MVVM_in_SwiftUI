//
//  OrderAccpetView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 14/08/23.
//

import SwiftUI

struct OrderAccpetView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                Image("order_accpeted")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.7)
                    .padding(.bottom, 32)
                
                Text("Your order has been \n accepted")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.semibold, fontSize: 28))
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 12)
                
                Text("Your items has been placcd and is on\nit’s way to being processed")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .padding(.bottom, 12)
                
                Spacer()
                Spacer()
                
                RoundButton(title: "Track Order") {
                    
                }
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Back to home")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryApp)
                        .padding(.vertical, 15)
                }
                .padding(.bottom , .bottomInsets + 15)

            }
            .padding(.horizontal, 20)
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct OrderAccpetView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAccpetView()
    }
}
