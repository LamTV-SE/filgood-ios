//
//  CustomColorFont.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import Foundation
import SwiftUI

struct FontName {
    static let raleway = "Raleway"
}

extension Font {
    static func customFont(name baseName: String, size: CGFloat, weightValue: Int) -> Font {
        let suffix: String

        switch weightValue {
        case 100:
            suffix = "-Thin"
        case 200:
            suffix = "-ExtraLight"
        case 300:
            suffix = "-Light"
        case 400:
            suffix = "-Regular"
        case 500:
            suffix = "-Medium"
        case 600:
            suffix = "-SemiBold"
        case 700:
            suffix = "-Bold"
        case 800:
            suffix = "-ExtraBold"
        case 900:
            suffix = "-Black"
        default:
            suffix = "-Regular"
        }

        let fullName = "\(baseName)\(suffix)"
        return .custom(fullName, size: size)
    }

}

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        let scanner = Scanner(string: hexSanitized)
        var int: UInt64 = 0
        scanner.scanHexInt64(&int)
        let r, g, b, a: UInt64

        switch hexSanitized.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (
                (int >> 8) * 17,
                (int >> 4 & 0xF) * 17,
                (int & 0xF) * 17,
                255
            )
        case 6: // RGB (24-bit)
            (r, g, b, a) = (
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF,
                255
            )
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF,
                int >> 24 & 0xFF
            )
        default:
            (r, g, b, a) = (1, 1, 1, 1)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

