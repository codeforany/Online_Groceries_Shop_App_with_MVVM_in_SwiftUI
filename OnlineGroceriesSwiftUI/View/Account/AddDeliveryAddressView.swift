//
//  AddDeliveryAddressView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 10/08/23.
//

import SwiftUI

struct AddDeliveryAddressView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isEdit: Bool = false
    @State var editObj: AddressModel?
    
    var body: some View {
        ZStack {
            
            ScrollView{
                VStack(spacing: 15){
                    
                    HStack{
                        
                        Button {
                            addressVM.txtTypeName = "Home"
                        } label: {
                            Image(systemName: addressVM.txtTypeName == "Home" ? "record.circle" : "circle"  )
                                
                            Text("Home")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .foregroundColor(.primaryText)
                        
                        Button {
                            addressVM.txtTypeName = "Office"
                        } label: {
                            Image(systemName: addressVM.txtTypeName == "Office" ? "record.circle" : "circle"  )
                                
                            Text("Office")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )
                        }
                        .foregroundColor(.primaryText)
                        
                        
                    }
                    
                    
                    LineTextField(title: "Name", placholder: "Enter you name" , txt: $addressVM.txtName)
                    
                    LineTextField(title: "Mobile", placholder: "Enter you mobile number", txt: $addressVM.txtMobile, keyboardType: .numberPad)
                    
                    LineTextField(title: "Address Line", placholder: "Enter you address" , txt: $addressVM.txtAddress)
                    
                    HStack{
                        LineTextField(title: "City", placholder: "Enter you city" , txt: $addressVM.txtCity)
                        LineTextField(title: "State", placholder: "Enter you state" , txt: $addressVM.txtState)
                    }
                   
                    
                    LineTextField(title: "Postal Code", placholder: "Enter you postal code" , txt: $addressVM.txtPostalCode)
                    
                    RoundButton(title: isEdit ? "Update Address" : "Add Address") {
                        if(isEdit) {
                            addressVM.serviceCallUpdateAddress(aObj: editObj) {
                                self.mode.wrappedValue.dismiss()
                            }
                        }else{
                            addressVM.serviceCallAddAddress {
                                self.mode.wrappedValue.dismiss()
                            }
                        }
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)

            }
            
            VStack {
                    
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                   
                    Spacer()
                    
                    Text( isEdit ? "Edit Delivery Address" : "Add Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    

                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
        }
        .onAppear{
            if(isEdit) {
                if let aObj = editObj {
                    addressVM.setData(aObj: aObj)
                }
            }
        }
        .alert(isPresented: $addressVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(addressVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct AddDeliveryAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeliveryAddressView()
    }
}
