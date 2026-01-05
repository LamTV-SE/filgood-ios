//
//  ForgotPasswordEnterView.swift
//  filgood-native
//
//  Created by Van Lam on 27/12/25.
//

import SwiftUI

struct ForgotPasswordEnterView: View {
    @State private var email: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("arrowLeftBlack16")
                Spacer()
            }
            .padding(.bottom, 25)
            Text("Mot de passe oublié")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
                .padding(.bottom, 40)
            InputCustomView(title: nil, placeholder: "Entrez votre e-mail", iconLeft: "lockGreen16", isPasswordInput: false, text: $email)
            Spacer()
            ButtonCustomView(title: "Enregistrer")
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ForgotPasswordEnterView()
}
