//
//  SearchView.swift
//  filgood-native
//
//  Created by Van Lam on 26/12/25.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    
    @Namespace private var productNamespace
    @Binding var selectedProduct: Product?
    @Binding var selectedProductPrefix: String
    
    private var mainView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Rechercher")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
                .padding(.bottom, 12)
            SearchBarView(backgroundInput: "#F9F9F9", text: $search)
                .padding(.bottom, 15)
            ScrollView(.vertical, showsIndicators: false) {
                ListProduct_Search(namespace: productNamespace, selectedProduct: $selectedProduct, selectedProductPrefix: $selectedProductPrefix, prefix: "search")
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
                ProductDetailView(selectedProductPrefix: $selectedProductPrefix, product: product, namespace: productNamespace, onClose: {
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
    @Previewable @State var selectedProduct: Product?
    @Previewable @State var selectedProductPrefix: String = ""
    SearchView(selectedProduct: $selectedProduct, selectedProductPrefix: $selectedProductPrefix)
}
