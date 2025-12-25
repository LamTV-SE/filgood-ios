//
//  CustomTabBarView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case search
    case favourite
    case chat
    case profile

    var icon: String {
        switch self {
        case .home: "homeTab"
        case .search: "searchTab"
        case .favourite: "favouriteTab"
        case .chat: "chatTab"
        case .profile: "profileTab"
        }
    }

    var iconActive: String {
        switch self {
        case .home: "homeTabActive"
        case .search: "searchTabActive"
        case .favourite: "favouriteTabActive"
        case .chat: "chatTabActive"
        case .profile: "profileTabActive"
        }
    }
}

struct CustomTabBarView: View {
    @Binding var selectedTab: Tab
    @Namespace private var animationNamespace

    var body: some View {
        GeometryReader(content: { geo in
            let tabWidth = geo.size.width / CGFloat(Tab.allCases.count)

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(hex: AppColor.secondary))
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                    .offset(x: CGFloat(Tab.allCases.firstIndex(of: selectedTab)!) * tabWidth + (tabWidth - 44) / 2)
                    .matchedGeometryEffect(id: "tabBackground", in: animationNamespace)

                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button {
                            withAnimation(.spring(response: 0.4)) {
                                selectedTab = tab
                            }
                        } label: {
                            Image(selectedTab == tab ? tab.iconActive : tab.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                    }
                }
            }
        })
        .padding(.top, 9)
        .frame(height: 100)
        .background(Color.white
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        )
        .shadow(
            color: Color.black.opacity(0.12),
            radius: 8,
            x: 0,
            y: -2
        )
    }
}

#Preview {
    @Previewable @State var tab: Tab = .home
    CustomTabBarView(selectedTab: $tab)
}
