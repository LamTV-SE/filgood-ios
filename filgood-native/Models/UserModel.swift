//
//  UserModel.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let user: User
    let token: String
}

// MARK: - User
struct User: Codable {
    let id: Int
    let profile: Profile
    let email: String
    let step: Int
    let emailVerifiedAt: String
    let address: Address
    let avatar: Avatar?
    let activeListing, commandListing, rating, registationYear: Int
    let connectPaypal, connectedStripe: Bool
    let language: String

    enum CodingKeys: String, CodingKey {
        case id, profile, email, step
        case emailVerifiedAt = "email_verified_at"
        case address, avatar
        case activeListing = "active_listing"
        case commandListing = "command_listing"
        case rating
        case registationYear = "registation_year"
        case connectPaypal = "connect_paypal"
        case connectedStripe = "connected_stripe"
        case language
    }
}

// MARK: - Avatar
struct Avatar: Codable {
    
}

// MARK: - Address
struct Address: Codable {
    let id: Int
    let name, address, codePostal, city: String
    let houseNumber, streetName: String
    let location: Location
    let numberPhone: String
    let isDefault: Int

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case codePostal = "code_postal"
        case city
        case houseNumber = "house_number"
        case streetName = "street_name"
        case location
        case numberPhone = "number_phone"
        case isDefault = "is_default"
    }
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double
}

// MARK: - Profile
struct Profile: Codable {
    let username, phone: String
    let canPushNoti: Int

    enum CodingKeys: String, CodingKey {
        case username, phone
        case canPushNoti = "can_push_noti"
    }
}
