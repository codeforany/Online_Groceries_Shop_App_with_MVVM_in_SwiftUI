//
//  ProductDetailView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 05/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]) )
    
    var body: some View {
        ZStack{
            
            ScrollView {
                ZStack{
                      Rectangle()
                        .foregroundColor( Color(hex: "F2F2F2") )
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                    
                    WebImage(url: URL(string: detailVM.pObj.image ))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                }
                .frame(width: .screenWidth, height: .screenWidth * 0.8)
                
                VStack{
                    HStack{
                        Text(detailVM.pObj.name)
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        } label: {
                            
                            Image( detailVM.isFav ? "favorite" : "fav"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondaryText)

                    }
                    Text("\(detailVM.pObj.unitValue)\(detailVM.pObj.unitName), Price")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        
                        Button {
                            detailVM.addSubQTY(isAdd: false)
                        } label: {
                            
                            Image( "subtack"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Text( "\(detailVM.qty)" )
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                        
                        Button {
                            detailVM.addSubQTY(isAdd: true)
                        } label: {
                            
                            Image( "add_green"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Spacer()
                        Text( "$\(  (detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty) , specifier: "%.2f")"  )
                            .font(.customfont(.bold, fontSize: 28))
                            .foregroundColor(.primaryText)
                            
                    }
                    .padding(.vertical, 8)
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack{
                    HStack{
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                            
                        } label: {
                            
                            Image( detailVM.isShowDetail ? "detail_open" : "next"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    }
                    
                    if(detailVM.isShowDetail) {
                        Text(detailVM.pObj.detail)
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom , 8)
                    }
                    
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                
                VStack{
                    HStack{
                        Text("Nutritions")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text(detailVM.pObj.nutritionWeight)
                            .font(.customfont(.semibold, fontSize: 10))
                            .foregroundColor(.secondaryText)
                            .padding(8)
                            .background( Color.placeholder.opacity(0.5) )
                            .cornerRadius(5)
                        
                        Button {
                            withAnimation {
                                detailVM.showNutrition()
                            }
                            
                        } label: {
                            
                            Image( detailVM.isShowNutrition ? "detail_open" : "next"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    }
                    
                    if(detailVM.isShowNutrition) {
                        LazyVStack {
                            
                            ForEach( detailVM.nutritionArr , id: \.id) { nObj in
                                HStack{
                                    Text( nObj.nutritionName )
                                        .font(.customfont(.semibold, fontSize: 15))
                                        .foregroundColor(.secondaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    Text( nObj.nutritionValue )
                                        .font(.customfont(.semibold, fontSize: 15))
                                        .foregroundColor(.primaryText)
                                }
                                
                                Divider()
                            }
                            .padding(.vertical, 0)
                           
                            
                        }
                        .padding(.horizontal, 10)
                    }
                    
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Review")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 2){
                        ForEach( 1...5 , id: \.self) { index in
                            
                            Image(systemName:  "star.fill")
                                .resizable()
                                .scaledToFit()
                                    .foregroundColor( Color.orange)
                                    .frame(width: 15, height: 15)
                                
                        }
                    }                   
                    
                    Button {
                       
                        
                    } label: {
                        
                        Image( "next" )
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(15)
                    }
                    .foregroundColor(Color.primaryText)

                }
                .padding(.horizontal, 20)
                
                RoundButton(title: "Add To Basket") {
                    CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty) { isDone, msg  in
                        
                        detailVM.qty = 1
                        
                        self.detailVM.errorMessage = msg
                        self.detailVM.showError = true
                    }
                }
                .padding( 20)
                
            }
            
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }

                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [
            
                "offer_price": 2.49,
                "start_date": "2023-07-30T18:30:00.000Z",
                "end_date": "2023-08-29T18:30:00.000Z",
                "prod_id": 5,
                "cat_id": 1,
                "brand_id": 1,
                "type_id": 1,
                "name": "Organic Banana",
                "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
                "unit_name": "pcs",
                "unit_value": "7",
                "nutrition_weight": "200g",
                "price": 2.99,
                "image": "http://192.168.1.3:3001/img/product/202307310947354735xuruflIucc.png",
                "cat_name": "Frash Fruits & Vegetable",
                "type_name": "Pulses",
                "is_fav": 1
            
        ])))
    }
}
