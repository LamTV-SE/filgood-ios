//
//  ProductItem_ChatDetailView.swift
//  filgood-native
//
//  Created by Van Lam on 8/1/26.
//

import SwiftUI

struct ProductItem_ChatDetailView: View {
    var body: some View {
        HStack(spacing: 12) {
            ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 67, height: 67, cornerRadius: 0)
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Mohair Sauge")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    Text("Drops · Sauge · Mohair")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                }
                Spacer()
                Text("7€")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.secondary))
            }
        }
        .padding(.trailing, 23)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        }
    }
}

#Preview {
    ProductItem_ChatDetailView()
}
