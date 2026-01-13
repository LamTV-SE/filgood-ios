//
//  ListProduct_Search.swift
//  filgood-native
//
//  Created by Van Lam on 26/12/25.
//

import SwiftUI

struct ListProduct_Search: View {
    let namespace: Namespace.ID
    @Binding var selectedProduct: Product?
    @Binding var selectedProductPrefix: String
    
    let products: [Product] = []
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let prefix: String
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(products, id: \.id) {product in
                productItemView(product: product)
            }
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
                    ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: (UIScreen.main.bounds.width - 41)/2 - 12, height: 127, cornerRadius: 10)
                        .padding(.bottom, 8)
                        .matchedGeometryEffect(id: "\(prefix)-\(product.id)", in: namespace, isSource: selectedProduct == nil)
                    Image("heartGray26")
                        .padding(5)
                }
                VStack(spacing: 6) {
                    HStack {
                        Text("Mohair Rose")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .foregroundColor(Color(hex:  AppColor.textBlack))
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

#Preview {
    @Previewable @State var selectedProductPrefix: String = ""
    
    ListProduct_Search(namespace: Namespace().wrappedValue, selectedProduct: .constant(nil), selectedProductPrefix: $selectedProductPrefix, prefix: "search")
}
