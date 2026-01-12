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
    @State private var capsuleScale: CGFloat = 1

    var body: some View {
        GeometryReader(content: { geo in
            let tabWidth = geo.size.width / CGFloat(Tab.allCases.count)

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(hex: AppColor.secondary))
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                    .scaleEffect(x: 1, y: capsuleScale)
                    .opacity(capsuleScale < 1 ? 0.8 : 1)
                    .offset(x: CGFloat(Tab.allCases.firstIndex(of: selectedTab)!) * tabWidth + (tabWidth - 44) / 2)
                    .matchedGeometryEffect(id: "tabBackground", in: animationNamespace)

                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button {
                            Task { @MainActor in
                                   withAnimation(.easeIn(duration: 0.12)) {
                                       capsuleScale = 0.4
                                   }

                                   try? await Task.sleep(nanoseconds: 120_000_000)

                                   withAnimation(.spring(response: 0.4, dampingFraction: 0.65)) {
                                       selectedTab = tab
                                       capsuleScale = 1
                                   }
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
