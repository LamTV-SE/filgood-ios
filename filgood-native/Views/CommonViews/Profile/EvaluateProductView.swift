//
//  EvaluateProductView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

struct EvaluateProductView: View {
    enum Tab {
        case bought
        case sold
    }
    
    @State private var selectedTab: Tab = .bought
    
    private let boughtDatas: [Int] = [0,1,2,3,4,5,6,7,8]
    private let soldDatas: [Int] = [0,1,2,3,4,5,6,7,8]
    
    @ViewBuilder
    private func TabItemView(title: String, isFocused: Bool, action: @escaping () -> Void) -> some View {
        Text(title)
            .font(.customFont(name: FontName.raleway, size: 13, weightValue: isFocused ? 700 : 500))
            .foregroundColor(Color(hex: isFocused ? AppColor.secondary : AppColor.textBlack))
            .padding(.horizontal, 17)
            .padding(.vertical, 11)
            .background(
                Capsule()
                    .fill(Color(hex: isFocused ? "#E9F1E7" : "#ECECEC"))
            )
            .overlay(
                Capsule()
                    .stroke(Color(hex: isFocused ? AppColor.secondary : "#ECECEC"), lineWidth: 1)
            )
            .onTapGesture {
                withAnimation(.easeInOut) {
                    action()
                }
            }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderMainView(title: "Commandes", isTitleLight: true)
                .padding(.bottom, 6)
            
            HStack(spacing: 10) {
                TabItemView(title: "Articles achetés", isFocused: selectedTab == .bought) {
                    selectedTab = .bought
                }
                TabItemView(title: "Articles vendus", isFocused: selectedTab == .sold) {
                    selectedTab = .sold
                }
                Spacer()
            }
            
            // Content
            TabView(selection: $selectedTab) {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(boughtDatas, id: \.self) { item in
                            BoughtItem_EvaluateProductView()
                        }
                    }
                }
                .tag(Tab.bought)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(soldDatas, id: \.self) { item in
                            SoldItem_EvaluateProductView()
                        }
                    }
                }
                .tag(Tab.sold)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            
            Spacer()
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    EvaluateProductView()
}
