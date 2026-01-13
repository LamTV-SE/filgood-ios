//
//  ProductHorizontalListView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct ProductHorizontalListView: View {
    let namespace: Namespace.ID
    @Binding var selectedProduct: Product?
    @Binding var selectedProductPrefix: String
    
    let products: [Product]
    let title: String
    let prefix: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .font(.customFont(name: FontName.raleway, size: 16, weightValue: 600))
                    .foregroundStyle(Color(hex:  AppColor.textBlack))
                Spacer()
                Text("Tout voir")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 700))
                    .foregroundStyle(Color(hex: AppColor.secondary))
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 11) {
                    ForEach(products, id: \.id) { product in
                        productItemView(product: product)
                            .id(product.id)
                    }
                }
            }
            .frame(height: 214)
        }
    }
    
    @ViewBuilder
    private func productItemView(product: Product) -> some View {
        Button {
            withAnimation(.spring(response: 0.45, dampingFraction: 1)) {
                selectedProduct = product
                selectedProductPrefix = prefix
            }
        } label: {
            VStack {
                ZStack(alignment: .topTrailing) {
                    ImageCustomView(url: product.images[0].fullURL, width: 179, height: 127, cornerRadius: 10)
                        .padding(.bottom, 8)
                        .matchedGeometryEffect(id: "\(prefix)-\(product.id)", in: namespace, isSource: selectedProduct == nil)
                    Image("heartGray26")
                        .padding(5)
                }
                VStack(spacing: 6) {
                    HStack {
                        Text(product.title)
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .foregroundColor(Color(hex:  AppColor.textBlack))
                            .frame(width: 100, alignment: .leading)
                            .lineLimit(1)
                        Spacer()
                        Text(product.price + "€")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .foregroundColor(Color(hex: AppColor.secondary))
                    }
                    HStack(spacing: 8) {
                        Text("\(product.availableStock)\(product.availableStock > 1 ? " pelotes" : " pelote")")
                            .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                            .foregroundColor(Color(hex: "#6D6D6D"))
                        HStack(spacing: 1) {
                            Image("locationPinGray14")
                            Text("\(product.formattedDistance)")
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
    @Previewable @State var selectedProductPrefix: String = ""
    ProductHorizontalListView(namespace: Namespace().wrappedValue, selectedProduct: .constant(nil), selectedProductPrefix: $selectedProductPrefix, products: [Product.mock], title: "Près de chez vous", prefix: "near-by")
        .padding()
}
