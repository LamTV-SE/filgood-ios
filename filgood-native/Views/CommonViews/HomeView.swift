//
//  HomeView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchValue: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            SearchBarView(text: $searchValue)
                .offset(y: 155)
                .zIndex(10)
                .padding(.horizontal, 15)
            VStack(spacing: 41) {
                VStack {
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
                VStack {
                    TagFilterListView()
                        .padding(.bottom, 23)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 30) {
                            ProductHorizontalListView()
                            ProductHorizontalListView()
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
}

#Preview {
    HomeView()
}
