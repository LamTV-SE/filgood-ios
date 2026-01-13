//
//  AuthViewModel.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import Foundation

final class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var token: String? = nil
    
    init() {
        if let savedToken = AuthManager.shared.token {
            self.token = savedToken
            self.isAuthenticated = true
        }
    }

    func loginSuccess(token: String) {
        self.token = token
        self.isAuthenticated = true
        AuthManager.shared.token = token
    }

    func logout() {
        self.token = nil
        self.isAuthenticated = false
        AuthManager.shared.token = nil
    }
}
