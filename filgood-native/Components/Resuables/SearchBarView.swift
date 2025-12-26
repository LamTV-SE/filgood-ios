//
//  SearchBarView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct SearchBarView: View {
    var backgroundInput: String = "#FFFFFF"
    var placeholder: String = "Rechercher..."
    
    @FocusState private var isFocused: Bool
    
    @Binding var text: String
    @State private var isShowPassword = false
    
    var body: some View {
        HStack {
            HStack(spacing: 9) {
                Image("searchGray16")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16)
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: "#919191")) // màu placeholder
                    }
                    TextField(placeholder, text: $text)
                        .focused($isFocused)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex:  AppColor.textBlack))
                }
            }
            Spacer()
            Image("filterGreen20")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
        }
        .onTapGesture {
            isFocused = true
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 15)
        .background(Color(hex: backgroundInput))
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

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var text = ""
    
    ZStack {
        SearchBarView(
            text: $text
        )
        .padding()
    }
}
