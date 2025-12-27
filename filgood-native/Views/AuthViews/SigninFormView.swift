//
//  SigninFormView.swift
//  filgood-native
//
//  Created by Van Lam on 27/12/25.
//

import SwiftUI

struct SigninFormView: View {
    @State private var lastName: String = ""
    @State private var firstName: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var isAcceptTerm: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("arrowLeftBlack16")
                Spacer()
            }
            .padding(.bottom, 25)
            Text("Créer un compte")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
            ZStack {
                Image("avatarDefault")
                    .frame(maxWidth: .infinity)
                Circle()
                    .fill(Color(hex: "#E7F9E2"))
                    .frame(width: 36, height: 36)
                    .overlay {
                        Image("cameraGreen20")
                    }
                    .offset(x: 42, y: 42)
            }
            .padding(.bottom, 20)
            VStack(spacing: 10) {
                InputCustomView(title: nil, placeholder: "Nom", iconLeft: "profileGreen16", isPasswordInput: false, text: $lastName)
                InputCustomView(title: nil, placeholder: "Prénom", iconLeft: "profileGreen16", isPasswordInput: false, text: $firstName)
                InputCustomView(title: nil, placeholder: "Numéro de téléphone", iconLeft: "phoneGreen16", isPasswordInput: false, text: $lastName)
                InputCustomView(title: nil, placeholder: "Numéro de téléphone", iconLeft: "locationPinGreen16", isPasswordInput: false, text: $address)
                HStack(spacing: 11) {
                    InputCustomView(title: nil, placeholder: "Code postal", iconLeft: "hastagGreen16", isPasswordInput: false, text: $address)
                    InputCustomView(title: nil, placeholder: "Ville", iconLeft: "mapGreen16", isPasswordInput: false, text: $address)
                }
            }
            Spacer()
            VStack(alignment: .leading, spacing: 25) {
                CheckBoxCustomView(label: "J’accepte les Conditions & la Politique de confidentialité.", isChecked: $isAcceptTerm)
                ButtonCustomView(title: "Enregistrer")
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    SigninFormView()
}
