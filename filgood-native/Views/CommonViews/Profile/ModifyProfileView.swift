//
//  ModifyProfileView.swift
//  filgood-native
//
//  Created by Van Lam on 9/1/26.
//

import SwiftUI

struct ModifyProfileView: View {
    @State private var lastName: String = ""
    @State private var firstName: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var codePostal: String = ""
    @State private var ville: String = ""
    @State private var isAcceptTerm: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderMainView(title: "Modifier votre profil")
                .padding(.bottom, 25)
            ZStack(alignment: .bottomTrailing) {
                ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 120, height: 120, cornerRadius: 60)
                Image("cameraGreen20")
                    .background(
                        Circle()
                            .fill(Color(hex: "#E7F9E2"))
                            .frame(width: 36, height: 36)
                    )
                    .frame(width: 36, height: 36)
            }
            .padding(.bottom, 20)
            VStack(spacing: 10) {
                InputCustomView(title: nil, placeholder: "Nom", iconLeft: "profileGreen16", isPasswordInput: false, text: $lastName)
                InputCustomView(title: nil, placeholder: "Prénom", iconLeft: "profileGreen16", isPasswordInput: false, text: $firstName)
                InputCustomView(title: nil, placeholder: "+33 6 12 34 56 78", iconLeft: "phoneGreen16", isPasswordInput: false, text: $phone)
                InputCustomView(title: nil, placeholder: "Adresse", iconLeft: "locationPinGreen16", isPasswordInput: false, text: $address)
                HStack(spacing: 11) {
                    InputCustomView(title: nil, placeholder: "Code postal", iconLeft: "hastagGreen16", isPasswordInput: false, text: $codePostal)
                    InputCustomView(title: nil, placeholder: "Ville", iconLeft: "mapGreen16", isPasswordInput: false, text: $ville)
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
    ModifyProfileView()
}
