//
//  MyOrdersDetailView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 15/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrdersDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: MyOrderDetailViewModel = MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [:]) )
    @State var showWriteReview = false
    
    var body: some View {
        ZStack{
            
            ScrollView {
                
                VStack{
                    HStack{
                        Text("Order ID: # \( detailVM.pObj.id )")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( getPaymentStatus(mObj: detailVM.pObj )  )
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor( getPaymentStatusColor(mObj: detailVM.pObj))
                    }
                    
                    
                    HStack{
                        Text(detailVM.pObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text( getOrderStatus(mObj: detailVM.pObj )  )
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor( getOrderStatusColor(mObj: detailVM.pObj))
                    }
                    .padding(.bottom, 8)
                    
                    Text("\(detailVM.pObj.address),\(detailVM.pObj.city), \(detailVM.pObj.state), \(detailVM.pObj.postalCode) ")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .multilineTextAlignment( .leading)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    HStack{
                        Text("Delivery Type:")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( getDeliveryType(mObj: detailVM.pObj )  )
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor( .primaryText )
                    }
                    .padding(.bottom, 4)
                    
                    HStack{
                        Text("Payment Type:")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( getPaymentType(mObj: detailVM.pObj )  )
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor( .primaryText )
                    }
                    
                    
                }
                .padding(15)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.15), radius: 2)
                .padding(.horizontal, 20)
                .padding(.top, .topInsets + 46)
                
                LazyVStack {
                    ForEach(detailVM.listArr, id: \.id) { pObj in
                        OrderItemRow(pObj: pObj, showReviewBotton: detailVM.pObj.orderStatus == 3 && pObj.rating == 0) {
                            showWriteReview = true
                        }
                    }
                }
                
                VStack{
                                       
                    HStack{
                        Text("Amount:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "$\( detailVM.pObj.totalPrice, specifier: "%.2f" )"  )
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor( .primaryText )
                    }
                    .padding(.bottom, 4)
                    
                    HStack{
                        Text("Delivery Cost:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "+ $\( detailVM.pObj.deliverPrice ?? 0.0, specifier: "%.2f" )"  )
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor( .primaryText )
                    }
                    .padding(.bottom, 4)
                    
                    HStack{
                        Text("Discount Cost:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "- $\( detailVM.pObj.discountPrice ?? 0.0, specifier: "%.2f" )"  )
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor( .red )
                    }
                    .padding(.bottom, 4)
                    
                    Divider()
                    
                    HStack{
                        Text("Total:")
                            .font(.customfont(.bold, fontSize: 22))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "$\( detailVM.pObj.userPayPrice ?? 0.0, specifier: "%.2f" )"  )
                            .font(.customfont(.bold, fontSize: 22))
                            .foregroundColor( .primaryText )
                    }
                    .padding(.bottom, 4)
                    
                    
                }
                .padding(15)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.15), radius: 2)
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
                
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
                    
                    Text("My Order Detail")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                    Spacer()
                    
                    
                    
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        })
        .background( NavigationLink(destination: WriteReviewView(), isActive: $showWriteReview, label: {
            EmptyView()
        }) )
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
    func getOrderStatus(mObj: MyOrderModel) -> String {
        switch mObj.orderStatus {
        case 1:
            return "Placed"
        case 2:
            return "Accepted";
        case 3:
            return "Delivered";
        case 4:
            return "Cancel";
        case 5:
            return "Declined";
        default:
            return "";
        }
    }
    
    func getDeliveryType(mObj: MyOrderModel) -> String {
        switch mObj.deliverType {
        case 1:
              return "Delivery";
            case 2:
              return "Collection";
        default:
            return "";
        }
    }
    
    func getPaymentType(mObj: MyOrderModel) -> String {
        switch mObj.paymentType {
        case 1:
            return "Cash On Delivery";
        case 2:
            return "Online Card Payment";
        default:
            return "";
        }
    }
    
    func getPaymentStatus(mObj: MyOrderModel) -> String {
        switch mObj.paymentStatus {
        case 1:
            return "Processing";
        case 2:
            return "Success";
        case 3:
            return "Fail";
        case 4:
            return "Refunded";
        default:
            return "";
        }
    }
    
    func getPaymentStatusColor(mObj: MyOrderModel) -> Color {
        
        if (mObj.paymentType == 1) {
            return Color.orange;
        }
        
        switch mObj.paymentStatus {
        case 1:
            return Color.blue;
        case 2:
            return Color.green;
        case 3:
            return Color.red;
        case 4:
            return Color.green;
        default:
            return Color.white;
        }
    }
    
    func getOrderStatusColor(mObj: MyOrderModel) -> Color {
        
     
        
        switch mObj.orderStatus {
        case 1:
              return Color.blue;
            case 2:
              return Color.green;
            case 3:
              return Color.green;
            case 4:
              return Color.red;
            case 5:
              return Color.red;
            default:
              return Color.primaryApp;        }
    }
}

struct MyOrdersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersDetailView(detailVM: MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [
            
            
                        "order_id": 4,
                        "cart_id": "22,23",
                        "total_price": 10.450000000000001,
                        "user_pay_price": 11.405000000000001,
                        "discount_price": 1.0450000000000002,
                        "deliver_price": 2,
                        "deliver_type": 1,
                        "payment_type": 2,
                        "payment_status": 2,
                        "order_status": 1,
                        "status": 1,
                        "created_date": "2023-08-10T05:09:14.000Z",
                        "names": "Organic Banana,Red Apple",
                        "images": "http://localhost:3001/img/product/202307310947354735xuruflIucc.png,http://localhost:3001/img/product/202307310951365136W6nJvPCdzQ.png",
                        "user_name": "My Home",
                        "phone": "98765432102",
                        "address": "246/ A, Dhutpeshwar Bldg, Girgaon Road, Near Gai Wadi, Girgaon",
                        "city": "Mumbai",
                        "state": "Maharashtra",
                        "postal_code": "400004"
                    
            
        ])))
    }
}
