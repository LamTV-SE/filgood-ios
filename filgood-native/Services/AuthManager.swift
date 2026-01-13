//
//  AuthManager.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    private init() {}
    
    private let tokenKey = "userToken"

    var token: String? {
        get { UserDefaults.standard.string(forKey: tokenKey) }
        set {
            if let token = newValue {
                UserDefaults.standard.set(newValue, forKey: tokenKey)
            } else {
                UserDefaults.standard.removeObject(forKey: tokenKey)
            }
        }
    }
}
