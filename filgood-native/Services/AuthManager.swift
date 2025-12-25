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

    var token: String? {
        get { UserDefaults.standard.string(forKey: "userToken") }
        set { UserDefaults.standard.set(newValue, forKey: "userToken") }
    }
}
