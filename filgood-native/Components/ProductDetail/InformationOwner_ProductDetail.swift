//
//  InformationOwner_ProductDetail.swift
//  filgood-native
//
//  Created by Van Lam on 26/12/25.
//

import SwiftUI

struct InformationOwner_ProductDetail: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Vendeur").font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
            
            HStack(spacing: 10) {
                VStack {
                    ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 51, height: 51, cornerRadius: nil)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Oriane")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    HStack(spacing: 4) {
                        Image("starGreen12")
                        HStack(spacing: 4) {
                            Text("4.9 (32)")
                                .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                                .foregroundColor(Color(hex: AppColor.secondary))
                            Text("· Membre depuis 2024")
                                .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                                .foregroundColor(Color(hex: "#7E7F7E"))
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: "#7CA072").opacity(0.2), lineWidth: 1)
            })
            .background(Color(hex: "#E7F9E2").clipShape(RoundedRectangle(cornerRadius: 12)))
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    InformationOwner_ProductDetail()
        .padding()
}
