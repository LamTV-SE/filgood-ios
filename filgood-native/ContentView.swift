//
//  ContentView.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()
    var body: some View {
        NavigationStack {
            DashboardView()
                .environmentObject(authVM)
        }
    }
}

#Preview {
    ContentView()
}
