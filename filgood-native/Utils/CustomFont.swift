//
//  CustomFont.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import Foundation
import SwiftUI

enum FontName {
    static let raleway = "Raleway"
}

extension Font {
    static func customFont(name baseName: String, size: CGFloat, weightValue: Int) -> Font {
        let suffix = switch weightValue {
        case 100:
            "-Thin"
        case 200:
            "-ExtraLight"
        case 300:
            "-Light"
        case 400:
            "-Regular"
        case 500:
            "-Medium"
        case 600:
            "-SemiBold"
        case 700:
            "-Bold"
        case 800:
            "-ExtraBold"
        case 900:
            "-Black"
        default:
            "-Regular"
        }

        let fullName = "\(baseName)\(suffix)"
        return .custom(fullName, size: size)
    }
}
