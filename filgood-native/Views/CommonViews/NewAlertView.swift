//
//  NewAlertView.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import SwiftUI

fileprivate struct FrequencyItem: Identifiable {
    let id: UUID
    let title: String
    var isChecked: Bool
}

struct NewAlertView: View {
    @State private var name: String = ""
    @State private var isPushNotification: Bool = false
    @State private var isEmailNotification: Bool = false
    
    @State private var freequencies: [FrequencyItem] = [
        .init(id: UUID(), title: "Temps réel (dès qu’une annonce correspond)", isChecked: false),
        .init(id: UUID(), title: "Quotidien (résumé)", isChecked: false),
        .init(id: UUID(), title: "Hebdomadaire", isChecked: false),
    ]
    
    private let filterItems: [String] = [
        "Mot clé : Mohair",
        "Couleur : Sauge",
        "Type : Fils",
        "Marque : Drops",
        "< 10 km"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderMainView(title: "Nouvelle alerte")
                .padding(.bottom, 13)
            FlowLayout {
                ForEach(filterItems, id: \.self) { item in
                    FilterCapsuleItem_NewAlert(title: item)
                        .fixedSize()
                }
            }
            .padding(.bottom, 14)
            VStack(alignment: .leading, spacing: 32) {
                HStack(spacing: 5) {
                    Image("editGreen16")
                    Text("Modifier la recherche")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.secondary))
                }
                InputCustomView(title: "Nom de l’alerte",placeholder: "Ex : Mohair Sauge - 10 km", text: $name)
                VStack(alignment: .leading, spacing: 14) {
                    Text("Fréquence")
                        .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    ForEach(freequencies.indices, id: \.self) { index in
                        CheckCircleCustomView(
                            label: freequencies[index].title,
                            isChecked: $freequencies[index].isChecked
                        )
                        
                        if index != freequencies.count - 1 {
                            Divider()
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Notifications")
                        .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    Toggle("Push", isOn: $isPushNotification)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                        .toggleStyle(CustomToggleStyle())
                        .padding(.bottom, 3)
                    Toggle("Email", isOn: $isEmailNotification)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                        .toggleStyle(CustomToggleStyle())
                }
            }
            .padding(.bottom, 24)
            (
                Text("Vous pourrez modifier ou supprimer cette alerte depuis ")
                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                    .foregroundColor(Color(hex: "#6D6D6D"))
                +
                Text("Mon Espace")
                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 600))
                    .underline()
                    .foregroundColor(Color(hex: "#6D6D6D"))
                +
                Text(" → ")
                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                    .foregroundColor(Color(hex: "#6D6D6D"))
                +
                Text("Recherches sauvegardées.")
                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 600))
                    .underline()
                    .foregroundColor(Color(hex: "#6D6D6D"))
            )
            .padding(.horizontal, 15)
            .padding(.vertical, 9.5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "#FCFCFC"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
            )
            .multilineTextAlignment(.leading)
            Spacer()
            ButtonCustomView(title: "Créer l’alerte")
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    NewAlertView()
}
