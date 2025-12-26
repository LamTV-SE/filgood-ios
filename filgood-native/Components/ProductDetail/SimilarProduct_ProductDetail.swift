//
//  SimilarProduct_ProductDetail.swift
//  filgood-native
//
//  Created by Van Lam on 26/12/25.
//

import SwiftUI

struct SimilarProduct_ProductDetail: View {
    private let products: [Int] = [1, 2]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("Annonces similaires")
                .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
            VStack(spacing: 10) {
                ForEach(products, id: \.self) {product in
                    similarProductItem()
                }
            }
        }
    }
    
    @ViewBuilder
    private func similarProductItem() -> some View {
        HStack(spacing: 14) {
            ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 76, height: 80, cornerRadius: 0)
            VStack(alignment: .leading, spacing: 4) {
                Text("Mohair Sauge")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                HStack {
                    Text("3 pelotes")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                        .foregroundColor(Color(hex: AppColor.secondary))
                    Spacer()
                    Text("7€")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.secondary))
                }
                Text("Drops · Sauge · Mohair")
                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                    .foregroundColor(Color(hex: "#7E7F7E"))
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
    SimilarProduct_ProductDetail()
        .padding()
}
