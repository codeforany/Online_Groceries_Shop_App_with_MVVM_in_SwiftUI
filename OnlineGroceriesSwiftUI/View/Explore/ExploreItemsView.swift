//
//  ExploreItemsView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 07/08/23.
//

import SwiftUI

struct ExploreItemsView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreCategoryModel (dict: [:]))
    
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ZStack{
            VStack {
                
                HStack{
                    
                    EmptyView()
                        .frame(width: 40, height: 40)
                    
                    Spacer()
                    
                    Text("Category")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("add_green")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    })
                    .frame(width: 40, height: 40)
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                
                
                
                ScrollView {
                    LazyVGrid(columns: columns,  spacing:15) {
                         
                        ForEach(itemsVM.listArr, id: \.id) {
                            pObj in
                            ProductCell( pObj: pObj, width: .infinity ) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.itemsVM.errorMessage = msg
                                    self.itemsVM.showError = true
                                }
                            }
                            
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $itemsVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(itemsVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct ExploreItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [
                "cat_id": 1,
                "cat_name": "Frash Fruits & Vegetable",
                "image": "http://192.168.1.3:3001/img/category/20230726155407547qM5gSxkrCh.png",
                "color": "53B175"
            ] ) ))
        }
        
    }
}
