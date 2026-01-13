//
//  LoginViewModel.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let authVM: AuthViewModel
    
    init(authVM: AuthViewModel) {
        self.authVM = authVM
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        WebService.shared.postJSON(
            url: "https://filgood.ruji.fr/api/auth/login",
            body: LoginRequest(email: email, password: password)
        ) { [weak self] (result: Result<APIResponse<LoginResponse>, Error>) in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let res):
                guard let data = res.data else {
                    self.errorMessage = res.message ?? "Missing data"
                    return
                }
                
                DispatchQueue.main.async {
                    AuthManager.shared.token = data.token
                    self.authVM.loginSuccess(token: data.token)
                }
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
            }
        }
    }
}
