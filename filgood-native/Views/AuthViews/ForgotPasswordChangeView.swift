//
//  ForgotPasswordChangeView.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct ForgotPasswordChangeView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("arrowLeftBlack16")
                Spacer()
            }
            .padding(.bottom, 25)
            Text("Modifier le mot de passe")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
                .padding(.bottom, 40)
            InputCustomView(title: nil, placeholder: "Mot de passe", iconLeft: "lockGreen16", isPasswordInput: false, text: $password)
                .padding(.bottom, 15)
            InputCustomView(title: nil, placeholder: "Confirmer le mot de passe", iconLeft: "lockGreen16", isPasswordInput: false, text: $confirmPassword)
            Spacer()
            ButtonCustomView(title: "Enregistrer")
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ForgotPasswordChangeView()
}
