//
//  NotificationView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 15/08/23.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var notiVM = NotificationViewModel.shared
    
    
    var body: some View {
        ZStack{
            
            ScrollView{
                LazyVStack(spacing: 15) {
                    ForEach( notiVM.listArr , id: \.id, content: {
                        nObj in
                        
                        
                        VStack{
                            HStack {
                                Text(nObj.title)
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                
                                Text(nObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                                    .font(.customfont(.regular, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                                
                            }
                            
                       
                                
                                Text(nObj.message)
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment( .leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                         
                        .padding(15)
                        .background( nObj.isRead == 1 ? Color.placeholder : Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                       


                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)

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
                    
                    Text("Notification")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    
                    Button {
                        
                        notiVM.serviceCallReadAll()
                    } label: {
                        Text("Read All")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryApp)
                    }

                    
                    

                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
            
            
            
        }
        .alert(isPresented: $notiVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(notiVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
