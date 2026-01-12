//
//  FavouriteView.swift
//  filgood-native
//
//  Created by Van Lam on 8/1/26.
//

import SwiftUI

struct FavouriteView: View {
    @State private var search = ""
    
    @Namespace private var productNamespace
    @Binding var selectedProduct: Int?
    
    private var mainView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Favoris")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
                .padding(.bottom, 12)
            ScrollView(.vertical, showsIndicators: false) {
                ListProduct_Search(namespace: productNamespace, selectedProduct: $selectedProduct)
                Spacer().frame(height: 15)
            }
            .padding(.bottom, 100)
        }
        .padding(.horizontal, 15)
    }
    
    var body: some View {
        ZStack {
            mainView

            if let product = selectedProduct {
                ProductDetailView(product: product, namespace: productNamespace, onClose: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 1)) {
                        selectedProduct = nil
                    }
                })
                .zIndex(20)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    @Previewable @State var selectedProduct: Int?
    
    FavouriteView(selectedProduct: $selectedProduct)
}
