//
//  QuantityItem_FilterSearch.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct QuantityItem_FilterSearch: View {
    var body: some View {
        HStack {
            Text("Quantité")
                .font(.customFont(name: FontName.raleway, size: 16, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
            Spacer()
            HStack(spacing: 18) {
                Image("minusCircle26")
                Text("1")
                    .font(.customFont(name: FontName.raleway, size: 18, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                Image("plusCircle26")
            }
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    QuantityItem_FilterSearch()
}
