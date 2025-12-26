//
//  DashboardView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab: Tab = .home
    @State private var selectedProduct: Int? = nil

    var body: some View {
        ZStack(alignment: .bottom) {
            pageView
                .frame(maxHeight: .infinity)
            
            if selectedProduct == nil {
                CustomTabBarView(selectedTab: $selectedTab)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color.white)
    }

    @ViewBuilder
    private var pageView: some View {
        Group {
            switch selectedTab {
            case .home: HomeView(selectedProduct: $selectedProduct)
            case .search: Text("Search")
            case .favourite: Text("Favourite")
            case .chat: Text("Chat")
            case .profile: Text("Profile")
            }
        }
        .transition(.identity)
    }
}

#Preview {
    DashboardView()
}
