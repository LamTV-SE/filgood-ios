//
//  ProductsHomeModel.swift
//  filgood-native
//
//  Created by Van Lam on 13/1/26.
//

import Foundation

// MARK: - ProductsHome
struct ProductsHomeResponse: Codable {
    let nearbyProducts, topPurchaseProducts: [Product]
    
    enum CodingKeys: String, CodingKey {
        case nearbyProducts = "nearby_products"
        case topPurchaseProducts = "top_purchase_products"
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let skeinSize, quantity: Int
    let price: String
    let availableStock: Int
    let isFavorited: Bool
    let ownerDistanceInKM: Double
    let images: [ImageMetaData]
    let categories: [Category]
    let brands, yarnTypes, collection: [ParentCategory]
    let colors: [ColorItem]
    let matters, ageGroups: [ParentCategory]
    let parentCategory: ParentCategory?
    let promotion: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, description
        case skeinSize = "skein_size"
        case quantity, price
        case availableStock = "available_stock"
        case isFavorited = "is_favorited"
        case ownerDistanceInKM = "owner_distance_in_km"
        case images, categories, brands, colors
        case yarnTypes = "yarn_types"
        case collection, matters
        case ageGroups = "age_groups"
        case parentCategory = "parent_category"
        case promotion
    }
}

// MARK: - ParentCategory
struct ParentCategory: Codable {
    let id: Int
    let name: String
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name, slug: String
    let isCheckbox: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case isCheckbox = "is_checkbox"
    }
}

// MARK: - ImageMetaData
struct ImageMetaData: Codable {
    let id: Int
    let filePath: String
    let fullURL: String
    let metadata: Metadata
    let storageType: String
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case filePath = "file_path"
        case fullURL = "full_url"
        case metadata
        case storageType = "storage_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Metadata
struct Metadata: Codable {
    let name: String?
    let size: Int?
    let type: String?
}

// MARK: - ColorItem
struct ColorItem: Codable {
    let id: Int
    let name: String
    let hexCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case hexCode = "hex_code"
    }
}

extension Product {
    var formattedDistance: String {
        String(format: "%.1f km", ownerDistanceInKM)
    }
    
    static let mock = Product(
        id: 19,
        title: "Mohair Rose",
        description: "Lot de 3 pelotes Mohair couleur Sauge, bain #314. Jamais utilisées.",
        skeinSize: 50,
        quantity: 3,
        price: "7.00",
        availableStock: 7,
        isFavorited: false,
        ownerDistanceInKM: 3.2,
        images: [
            ImageMetaData(
                id: 1,
                filePath: "",
                fullURL: "https://api.ia-arena.ruji.fr/storage/fakes/fake_7.jpeg",
                metadata: Metadata(
                    name: "mock.jpg",
                    size: 100000,
                    type: "image/jpeg"
                ),
                storageType: "public",
                createdAt: "2025-12-11T04:33:30.000000Z",
                updatedAt: "2025-12-11T04:33:30.000000Z"
            )
        ],
        categories: [
            Category(
                id: 1,
                name: "Aiguilles & crochets",
                slug: "aiguilles-crochets",
                isCheckbox: nil
            )
        ],
        brands: [
            ParentCategory(id: 3, name: "Drops")
        ],
        yarnTypes: [
            ParentCategory(id: 2, name: "Mohair")
        ],
        collection: [],
        colors: [
            ColorItem(id: 2, name: "Sauge", hexCode: "#9CAF88")
        ],
        matters: [],
        ageGroups: [],
        parentCategory: nil,
        promotion: nil
    )
}
