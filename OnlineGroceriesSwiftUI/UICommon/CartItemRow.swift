//
//  CartItemRow.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 08/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemRow: View {
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                WebImage(url: URL(string: cObj.image ))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
            
                VStack(spacing: 4){
                    
                    HStack {
                        Text(cObj.name)
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            CartViewModel.shared.serviceCallRemove(cObj: cObj)
                        } label: {
                            Image("close")
                                .resizable()
                                .frame(width: 18, height: 18)
                        }

                    }
                   
                    
                    Text("\(cObj.unitValue)\(cObj.unitName), price")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    
                    HStack{
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty - 1)
                        } label: {
                            
                            Image( "subtack"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                        )
                        
                        Text( "\(cObj.qty)" )
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            
                        
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty + 1)
                        } label: {
                            
                            Image( "add_green"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                        )
                        
                        Spacer()
                        
                        Text("$\(cObj.offerPrice ?? cObj.price, specifier: "%.2f" )")
                            .font(.customfont(.semibold, fontSize: 20))
                            .foregroundColor(.primaryText)
                    }
                    
                }
                
                
                
            }
            Divider()
        }
    }
}

struct CartItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CartItemRow(cObj: CartItemModel(dict: [
            "cart_id": 7,
                       "user_id": 2,
                       "prod_id": 5,
                       "qty": 1,
                       "cat_id": 1,
                       "brand_id": 1,
                       "type_id": 1,
                       "name": "Organic Banana",
                       "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
                       "unit_name": "pcs",
                       "unit_value": "7",
                       "nutrition_weight": "200g",
                       "price": 2.99,
                       "created_date": "2023-07-31T04:17:35.000Z",
                       "modify_date": "2023-07-31T04:17:35.000Z",
                       "cat_name": "Frash Fruits & Vegetable",
                       "is_fav": 1,
                       "brand_name": "bigs",
                       "type_name": "Pulses",
                       "offer_price": 2.49,
                       "start_date": "2023-07-31 00:00:00",
                       "end_date": "2023-08-30 00:00:00",
                       "is_offer_active": 1,
                       "image": "http://localhost:3001/img/product/202307310947354735xuruflIucc.png",
                       "item_price": 2.49,
                       "total_price": 2.49
                   ]))
        .padding(.horizontal, 20)
    }
}
