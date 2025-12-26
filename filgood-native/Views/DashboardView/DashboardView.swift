//
//  DashboardView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack {
            pageView

            Spacer()

            CustomTabBarView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color.white)
    }

    @ViewBuilder
    private var pageView: some View {
        Group {
            switch selectedTab {
            case .home: HomeView()
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
