//
//  LoginView.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRemember: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                VStack(spacing: 30) {
                    Text("Se connecter")
                        .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
                        .foregroundColor(Color(hex:  AppColor.textBlack))
                    VStack(spacing: 15) {
                        VStack(spacing: 10) {
                            InputCustomView(title: nil, placeholder: "Entrez votre e-mail", iconLeft: "emailGreen16", isPasswordInput: false, text: $email)
                            InputCustomView(title: nil, placeholder: "Entrez votre mot de passe", iconLeft: "lockGreen16", isPasswordInput: false, text: $password)
                        }
                        HStack {
                            CheckBoxCustomView(label: "Se souvenir de moi", isChecked: $isRemember)
                            Spacer()
                            Text("Mot de passe oublié ?")
                                .font(.customFont(name: FontName.raleway, size: 12, weightValue: 600))
                                .foregroundColor(Color(hex: AppColor.secondary))
                        }
                        ButtonCustomView(title: "Se connecter", icon: nil)
                    }
                    HStack(spacing: 12) {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(Color(hex: "#E9E9E9"))
                        Text("Ou inscrivez-vous avec")
                            .font(.customFont(name: FontName.raleway, size: 12, weightValue: 300))
                            .foregroundStyle(Color(hex: "#919191"))
                            .lineLimit(1)
                            .fixedSize(horizontal: true, vertical: false)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(Color(hex: "#E9E9E9"))
                    }
                    HStack(spacing: 10) {
                        ButtonCustomView(title: nil, icon: "google20", borderWidth: 1, backgroundColor: "#FFFFFF", paddingVertical: 15)
                        ButtonCustomView(title: nil, icon: "apple20", borderWidth: 1, backgroundColor: "#FFFFFF", paddingVertical: 15)
                    }
                    Spacer()
                    HStack(spacing: 4) {
                        Text("Vous avez déjà un compte ?")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex:  AppColor.textBlack))
                        Text("Connectez-vous.")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .foregroundColor(Color(hex: AppColor.secondary))
                    }
                }
                .padding(.top, 30)
                .padding(.bottom, 40)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "#FAFAFA"))
                .clipShape(
                    .rect(
                        topLeadingRadius: 20,
                        topTrailingRadius: 20
                    )
                )
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex: AppColor.primary))
    }
}

#Preview {
    LoginView()
}
