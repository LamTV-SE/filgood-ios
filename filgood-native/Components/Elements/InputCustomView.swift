//
//  InputCustomView.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import SwiftUI

struct InputCustomView: View {
    var title: String?
    var placeholder: String = ""
    var isRequired: Bool? = true
    var iconLeft: String?
    var isPasswordInput: Bool = false

    @FocusState private var isFocused: Bool

    @Binding var text: String
    @State private var isShowPassword = false

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let title {
                HStack {
                    Text(title)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 700))
                    if isRequired == true {
                        Text("*")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 700))
                    }
                }
            } else {
                EmptyView()
            }
            HStack(spacing: 9) {
                if let iconLeft {
                    Image(iconLeft)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                }
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: "#919191")) // màu placeholder
                    }
                    if isPasswordInput {
                        if isShowPassword {
                            TextField(placeholder, text: $text)
                                .focused($isFocused)
                                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                                .foregroundColor(Color(hex: AppColor.textBlack))
                        } else {
                            SecureField(placeholder, text: $text)
                                .focused($isFocused)
                                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                                .foregroundColor(Color(hex:  AppColor.textBlack))
                        }
                    } else {
                        TextField(placeholder, text: $text)
                            .focused($isFocused)
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex:  AppColor.textBlack))
                    }
                }

                if isPasswordInput == true {
                    Button {
                        isShowPassword.toggle()
                    } label: {
                        Image(systemName: isShowPassword ? "eye.slash" : "eye")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                    }
                }
            }
            .onTapGesture {
                isFocused = true
            }
            .padding(17)
            .background(.white)
            .frame(height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
            )
        }
    }
}

#Preview {
    @Previewable @State var text = ""

    ZStack {
        InputCustomView(
            title: "Identifiant",
            placeholder: "Entrez votre e-mail",
            iconLeft: "emailGreen16",
            isPasswordInput: false,
            text: $text
        )
        .padding()
    }
}
