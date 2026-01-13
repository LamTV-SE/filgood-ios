//
//  DashboardView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var selectedTab: Tab = .home
    @State private var selectedProduct: Int? = nil
    @State private var isShowNewAlert: Bool = false
    
    @ViewBuilder
    private func mainContent() -> some View {
        ZStack(alignment: .bottomTrailing) {
            pageView
                .frame(maxHeight: .infinity)
            
            if selectedProduct == nil {
                CustomTabBarView(selectedTab: $selectedTab)
                    .transition(.move(edge: .bottom))
            }
            
            Button {
                isShowNewAlert = true
            } label: {
                HStack(spacing: 8) {
                    Image("plusWhite18")
                    Text("Alerte")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 700))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 23)
                .background{
                    Capsule()
                        .fill(Color(hex: "#20231F"))
                }
                
            }
            .offset(x: -23, y: -116)
            
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color.white)
        .navigationDestination(isPresented: $isShowNewAlert) {
            NewAlertView()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
    }
    
    var body: some View {
        ZStack {
            LoginView(authVM: authVM)
                .offset(x: authVM.isAuthenticated ? -UIScreen.main.bounds.width : 0)
            mainContent()
                .offset(x: authVM.isAuthenticated ? 0 : UIScreen.main.bounds.width)
        }
        .animation(.easeInOut(duration: 0.3), value: authVM.isAuthenticated)
    }
    
    @ViewBuilder
    private var pageView: some View {
        Group {
            switch selectedTab {
            case .home: HomeView(selectedProduct: $selectedProduct)
            case .search: SearchView(selectedProduct: $selectedProduct)
            case .favourite: FavouriteView(selectedProduct: $selectedProduct)
            case .chat: ChatView()
            case .profile: ProfileView()
            }
        }
        .transition(.identity)
    }
}

#Preview {
    DashboardView()
        .environmentObject(AuthViewModel())
}
