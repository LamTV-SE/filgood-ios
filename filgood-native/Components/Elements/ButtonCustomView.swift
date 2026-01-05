//
//  ButtonCustomView.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import SwiftUI

struct ButtonCustomView: View {
    var title: String?
    var disable: Bool? = false
    var icon: String?
    var borderWidth: CGFloat = 0
    var backgroundColor: String = AppColor.secondary
    var textColor: String = "#FFFFFF"
    var paddingVertical: CGFloat = 18

    var body: some View {
        Button {
            print("Button tapped!")
        } label: {
            HStack(spacing: 12) {
                if let icon {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                }
                if let title {
                    Text(title)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 700))
                        .foregroundColor((disable ?? false) ? Color(hex: "#BAB5C1") : Color(hex: textColor))
                }
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .padding(.vertical, paddingVertical)
        .frame(maxWidth: .infinity)
        .background(Color(hex: backgroundColor))
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(borderWidth > 0 ? Color(hex: "#E9E9E9") : .clear, lineWidth: 1))
        .cornerRadius(10)
    }
}

#Preview {
    ButtonCustomView(title: "Se connecter", icon: nil, borderWidth: 1)
        .padding()
}
