//
//  BoughtItem_EvaluateProductView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

struct BoughtItem_EvaluateProductView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Shop ABC")
                    .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                Spacer()
                Text("Achevé")
                    .font(.customFont(name: FontName.raleway, size: 12, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.secondary))
            }
            HStack(alignment: .top, spacing: 7) {
                ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 60, height: 60, cornerRadius: 8)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Mohair Sauge")
                        .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    Text("Drops · Sauge · Mohair")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    Text("Red · Yellow")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                }
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
            .padding(.leading, 67)
            .padding(.bottom, 2)
            HStack {
                ButtonCustomView(title: "Retour", backgroundColor: "#ECECEC", textColor: AppColor.textBlack, paddingVertical: 10)
                ButtonCustomView(title: "Avis", paddingVertical: 10)
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
    BoughtItem_EvaluateProductView()
        .padding()
}
