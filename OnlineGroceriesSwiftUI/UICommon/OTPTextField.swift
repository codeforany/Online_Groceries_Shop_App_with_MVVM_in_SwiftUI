//
//  OTPTextField.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 18/09/23.
//

import SwiftUI

struct OTPTextField: View {
    @Binding var txtOTP: String
    @State var placeholder: String = "-"
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                var otpCode = txtOTP.map { String($0) }
                ForEach(0..<6, id: \.self) { index in
                    VStack {
                        
                        if( index < otpCode.count) {
                            Text( otpCode[index] )
                        }else{
                            Text( placeholder )
                        }
                        
                        Divider()
                    }
                    .frame(width: 45, height: 50)
                }
                Spacer()
            }
            
            TextField("", text: $txtOTP)
                .keyboardType(.numberPad)
                .foregroundColor(.clear)
                .accentColor(.clear)
            
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    @State static var txtCode = ""
    static var previews: some View {
        OTPTextField(txtOTP: $txtCode)
    }
}
