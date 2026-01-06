//
//  CheckBoxCustomView.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import SwiftUI

import SwiftUI

struct CheckCircleCustomView: View {
    var label: String?

    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(isChecked ? Color(hex: AppColor.secondary) : .white)
                        .stroke(Color(hex: "#DDDDDD"), lineWidth: 1)
                        .frame(width: 22, height: 22)
                    if isChecked {
                        Image("checkWhite10")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                    }
                }

                if let label {
                    Text(label)
                        .foregroundColor(Color(hex: AppColor.textBlack))
                        .font(.customFont(name: FontName.raleway, size: 12, weightValue: 400))
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    @Previewable @State var isChecked = false
    CheckCircleCustomView(isChecked: $isChecked)
}
