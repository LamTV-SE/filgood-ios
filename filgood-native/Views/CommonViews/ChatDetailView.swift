//
//  ChatDetailView.swift
//  filgood-native
//
//  Created by Van Lam on 8/1/26.
//

import SwiftUI

struct ChatDetailView: View {
    private let messages: [Int] = [1,2,3,4,5,6,7,8,9,10]
    var body: some View {
        VStack(spacing: 14) {
            VStack(spacing: 11) {
                HStack(spacing: 14) {
                    Image("arrowLeftBlack16")
                    
                    HStack(spacing: 12) {
                        ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 48, height: 48, cornerRadius: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Oriane")
                                .font(.customFont(name: FontName.raleway, size: 18, weightValue: 600))
                                .foregroundColor(Color(hex: AppColor.textBlack))
                            HStack(spacing: 4) {
                                Image("starGreen12")
                                (
                                    Text("4.9 (32)")
                                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                                        .foregroundColor(Color(hex: AppColor.secondary))
                                    +
                                    Text(" · Membre depuis 2024")
                                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                                        .foregroundColor(Color(hex: "#7E7F7E"))
                                )
                            }
                        }
                    }
                    
                    Spacer()
                    Image("threeDotVertical23")
                }
                
                ProductItem_ChatDetailView()
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 18)
            .background(Color(hex: "#FBFBFB"))
            .overlay(
                Rectangle()
                    .fill(Color(hex: "#E9E9E9"))
                    .frame(height: 1),
                alignment: .bottom
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(messages, id: \.self) {message in
                        ChatDetailItem_ChatDetailView()
                    }
                }
            }
            Text("Votre commande est validée. Veuillez attendre la confirmation d’envoi d’Oriane.")
                .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                .foregroundColor(Color(hex: "#436739"))
                .padding(.vertical, 8.5)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#E7F9E2"))
                        .frame(maxWidth: .infinity)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#7CA072").opacity(0.19), lineWidth: 1)
                )
                .padding(.horizontal, 15)
            
            ChatBox_ChatDetailView()
                .padding(.horizontal, 15)
        }
    }
}

#Preview {
    ChatDetailView()
}
