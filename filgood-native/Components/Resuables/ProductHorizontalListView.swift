//
//  ProductHorizontalListView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct ProductHorizontalListView: View {
    let namespace: Namespace.ID
    @Binding var selectedProduct: Int?

    let products: [Int] = [1, 2, 3, 4, 5]

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Près de chez vous")
                    .font(.customFont(name: FontName.raleway, size: 16, weightValue: 600))
                    .foregroundStyle(Color(hex: "#040415"))
                Spacer()
                Text("Tout voir")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 700))
                    .foregroundStyle(Color(hex: AppColor.secondary))
            }

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 11) {
                    ForEach(products, id: \.self) { product in
                        productItemView(product: product)
                            .id(product)
                    }
                }
            }
            .frame(height: 214)
        }
    }

    @ViewBuilder
    private func productItemView(product: Int) -> some View {
        Button {
            withAnimation(.spring(response: 0.45, dampingFraction: 1)) {
                selectedProduct = product
            }
        } label: {
            VStack {
                ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 179, height: 127, cornerRadius: 10)
                    .padding(.bottom, 8)
                    .matchedGeometryEffect(id: "product-image-\(product)", in: namespace)
                VStack(spacing: 6) {
                    HStack {
                        Text("Mohair Rose")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .foregroundColor(Color(hex: "#040415"))
                        Spacer()
                        Text("8€")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .foregroundColor(Color(hex: AppColor.secondary))
                    }
                    HStack(spacing: 8) {
                        Text("3 pelotes")
                            .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                            .foregroundColor(Color(hex: "#6D6D6D"))
                        HStack(spacing: 1) {
                            Image("locationPinGray14")
                            Text("2 km")
                                .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                                .foregroundColor(Color(hex: "#6D6D6D"))
                        }
                        Spacer()
                    }
                }
                .padding(.leading, 7)
                .padding(.trailing, 11)
            }
            .padding(6)
            .padding(.bottom, 15)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProductHorizontalListView(namespace: Namespace().wrappedValue, selectedProduct: .constant(nil))
        .padding()
}
