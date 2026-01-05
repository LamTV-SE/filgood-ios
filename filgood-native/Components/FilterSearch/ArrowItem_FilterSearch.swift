//
//  ArrowItem_FilterSearch.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct ArrowItem_FilterSearch: View {
    let textLabel: String
    let textValue: String
    let valueActive: Bool
    
    var body: some View {
        HStack {
            Text(textLabel)
                .font(.customFont(name: FontName.raleway, size: 16, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
            Spacer()
            HStack(spacing: 2) {
                Spacer()
                Text(textValue)
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: valueActive ? 600 : 400))
                    .foregroundColor(Color(hex: valueActive ? AppColor.secondary : AppColor.textBlack))
                    .frame(minWidth: 0, maxWidth: 184, alignment: .trailing)
                    .lineLimit(1)
                Image("arrowRightGray19")
            }
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    ArrowItem_FilterSearch(textLabel: "Marque",textValue: "Coton", valueActive: true)
}
