//
//  WriteReviewView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by CodeForAny on 28/06/24.
//

import SwiftUI

struct WriteReviewView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var txtMessage = ""
    @State var rating = 3
    
    var body: some View {
        
        ZStack{
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    HStack(spacing: 15) {
                        ForEach(1...5, id: \.self) {
                            index in
                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor( index <= rating ? Color.orange : Color.black.opacity(0.2))
                                .frame(width: .widthPer(per: 0.1), height: .widthPer(per: 0.1))
                                .onTapGesture {
                                    rating = index
                                }
                        }
                    }
                    
                    
                    ZStack(alignment: .leading, content: {
                        
                            TextEditor(text: $txtMessage)
                            .multilineTextAlignment(.leading)
                            .onAppear(){
                                UITextView.appearance().backgroundColor = .clear
                            }
                        
                        VStack {
                            Text( txtMessage == "" ? "Write A Review here ..." : "" )
                                .padding(8)
                                .foregroundColor(.placeholder)
                            
                            Spacer()
                        }
                        
                    })
                    .padding(15)
                    .frame(minHeight: 300)
                    .background( Color.black.opacity(0.05) )
                    .cornerRadius(10)
                    .padding(.bottom, 15)
                    
                    RoundButton(title: "Submit") {
                        
                    }
                }
                .padding(20)
                .padding(.top, .topInsets + 60)
            }
            
            VStack{
                
                HStack{
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    })
                    
                    Spacer()
                    
                    Text("Write A Review")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background( Color.white )
                .shadow(color: .black.opacity(0.2), radius: 2)
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        
    }
}

#Preview {
    WriteReviewView()
}
