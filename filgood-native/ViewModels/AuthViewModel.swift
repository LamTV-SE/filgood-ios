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

    func loginSuccess(token: String) {
        self.token = token
        self.isAuthenticated = true
    } 

    func logout() {
        self.token = nil
        self.isAuthenticated = false
    }
}
