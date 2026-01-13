//
//  API.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let success: Bool
    let data: T?
    let message: String?
}
