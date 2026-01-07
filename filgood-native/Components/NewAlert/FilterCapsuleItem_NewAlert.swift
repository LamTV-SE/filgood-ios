//
//  FilterCapsuleItem_NewAlert.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import SwiftUI

struct FilterCapsuleItem_NewAlert: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
            .foregroundColor(Color(hex: "#436739"))
            .padding(.horizontal, 17)
            .padding(.vertical, 9)
            .background(
                Capsule()
                    .fill(Color(hex: "#E7F9E2"))
            )
            .overlay(
                Capsule()
                    .stroke(Color(hex: "#7CA072").opacity(0.3), lineWidth: 1)
            )
    }
}

#Preview {
    FilterCapsuleItem_NewAlert(title: "Mot clé : Mohair")
}
