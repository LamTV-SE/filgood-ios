//
//  HomeView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchValue: String = ""
    
    @Namespace private var productNamespace
    @State private var selectedProduct: Int? = nil
    
    private var headerView: some View {
        VStack(spacing: 29) {
            HStack {
                Text("filgood")
                    .font(.customFont(name: FontName.raleway, size: 26, weightValue: 700))
                    .foregroundColor(.white)
                Spacer()
                Image("bellWhite23")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 23)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Ne laissez plus vos pelotes dormir")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                    .foregroundColor(.white)
                Text("Vendez, troquez ou achetez près de chez vous ")
                    .font(.customFont(name: FontName.raleway, size: 24, weightValue: 700))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 15)
    }
    
    private var mainView: some View {
        ZStack(alignment: .top) {
            SearchBarView(text: $searchValue)
                .offset(y: 155)
                .zIndex(10)
                .padding(.horizontal, 15)
            VStack(spacing: 41) {
                headerView
                VStack {
                    TagFilterListView()
                        .padding(.bottom, 23)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 30) {
                            ProductHorizontalListView(namespace: productNamespace, selectedProduct: $selectedProduct)
//                            ProductHorizontalListView()
                        }
                    }
                    .background(Color(hex: "#FAFAFA"))
                    
                }
                .padding(.top, 35)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color(hex: "#FAFAFA"))
                .ignoresSafeArea(.all, edges: .bottom)
                .clipShape(.rect(
                    topLeadingRadius: 20,
                    topTrailingRadius: 20
                ))
            }
        }
        .background(Color(hex: AppColor.secondary))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all, edges: .bottom)
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
    }
}

#Preview {
    HomeView()
}
