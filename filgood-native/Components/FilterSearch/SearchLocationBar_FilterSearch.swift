//
//  SearchLocationBar_FilterSearch.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import SwiftUI

struct SearchLocationBar_FilterSearch: View {
    @FocusState private var isFocused: Bool
    
    @Binding var text: String
    @State private var isShowPassword = false
    
    var body: some View {
        HStack {
            HStack(spacing: 9) {
                Image("locationPinGray16")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16)
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text("Votre localisation...")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: "#919191")) // màu placeholder
                    }
                    TextField("Votre localisation...", text: $text)
                        .focused($isFocused)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex:  AppColor.textBlack))
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(Color(hex: "#E7F9E2"))
                        .frame(width: 36, height: 36)
                    Image("aMoonLocationGreen16")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                }
            }
        }
        .onTapGesture {
            isFocused = true
        }
        .padding(.leading, 14)
        .padding(.trailing, 7)
        .padding(.vertical, 15)
        .background(Color(hex: AppColor.white))
        .frame(height: 50)
        .clipShape(.rect(
            topLeadingRadius: 12,
            bottomLeadingRadius: 12,
            bottomTrailingRadius: 12,
            topTrailingRadius: 12
        ))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        )
    }
}

#Preview {
    @Previewable @State var text = ""
    SearchLocationBar_FilterSearch(text: $text)
        .padding()
}
