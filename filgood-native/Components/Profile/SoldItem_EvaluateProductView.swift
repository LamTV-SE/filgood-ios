//
//  SoldItem_EvaluateProductView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

struct SoldItem_EvaluateProductView: View {
    private let totalStar = 5
    private let rating = 4
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .top, spacing: 7) {
                ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 60, height: 60, cornerRadius: 8)
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Mohair Sauge")
                            .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                            .foregroundColor(Color(hex: AppColor.textBlack))
                        Spacer()
                        Text("Achevé")
                            .font(.customFont(name: FontName.raleway, size: 12, weightValue: 600))
                            .foregroundColor(Color(hex: AppColor.secondary))
                    }
                    Text("Drops · Sauge · Mohair")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    HStack {
                        Text("Blue")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: "#7E7F7E"))
                        Spacer()
                        Text("×3")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .foregroundColor(Color(hex: AppColor.textBlack))
                    }
                    HStack {
                        Text("Total (3 produits):")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: "#7E7F7E"))
                        Spacer()
                        Text("7.00€")
                            .font(.customFont(name: FontName.raleway, size: 16, weightValue: 700))
                            .foregroundColor(Color(hex: AppColor.textBlack))
                    }
                }
            }
            Divider()
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 5) {
                    Text("Date de vente:")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    Text("11/02/2025")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                }
                HStack {
                    HStack(spacing: 5) {
                        Text("Acheteur:")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: "#7E7F7E"))
                        Text("Louis Martin")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: AppColor.textBlack))
                    }
                    Spacer()
                    HStack(spacing: 2) {
                        ForEach(0..<totalStar, id: \.self) {index in
                            Image(index < rating ? "starGreen10" : "starSolidGreen10")
                        }
                    }
                }
            }
        }
        .padding(15)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        )
    }
}

#Preview {
    SoldItem_EvaluateProductView()
        .padding()
}
