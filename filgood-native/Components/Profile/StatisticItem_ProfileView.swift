//
//  StatisticItem_ProfileView.swift
//  filgood-native
//
//  Created by Van Lam on 9/1/26.
//

import SwiftUI

struct StatisticItem_ProfileView: View {
    let title: String
    let value: String
    let icon: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                .foregroundColor(Color(hex: "#474847").opacity(0.77))
            HStack {
                HStack(spacing: 7) {
                    Image(icon)
                    Text(value)
                        .font(.customFont(name: FontName.raleway, size: 18, weightValue: 500))
                }
                Spacer()
                Image("arrowTopRightGreen16")
                    .background(
                        Circle()
                            .fill(Color(hex: "#E7F9E2"))
                            .frame(width: 24, height: 24)
                    )
            }
        }
        .padding(.vertical, 15)
        .padding(.leading, 15)
        .padding(.trailing, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        )
    }
}

#Preview {
    StatisticItem_ProfileView(title: "Annonces actives", value: "6", icon: "newsGreen16")
        .padding()
}
