//
//  ProfileView.swift
//  filgood-native
//
//  Created by Van Lam on 9/1/26.
//

import SwiftUI

struct ProfileView: View {
    @State var isNotficationPush: Bool = false
    
    @ViewBuilder
    private func ArrowItem(title: String) -> some View {
        HStack {
            Text(title)
                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                .foregroundColor(Color(hex: AppColor.textBlack).opacity(0.8))
            Spacer()
            Image("arrowRightGray17")
        }
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Image("editBlack25")
                }
                .padding(.horizontal, 9)
                .padding(.bottom, 11)
                
                VStack(spacing: 8) {
                    ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 120, height: 120, cornerRadius: 60)
                        .padding(.bottom, 10)
                    Text("Louise Dusmenil")
                        .font(.customFont(name: FontName.raleway, size: 22, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    Text("Membre depuis 2024")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                        .padding(.bottom, 2)
                    HStack(spacing: 16) {
                        HStack(spacing: 3) {
                            Image("locationPinGreen16")
                            Text("Montpellier")
                                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                                .foregroundColor(Color(hex: AppColor.textBlack))
                        }
                        HStack(spacing: 3) {
                            Image("starSolidGreen16")
                            Text("4.9")
                                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                                .foregroundColor(Color(hex: AppColor.textBlack))
                        }
                    }
                    
                }
                HStack(spacing: 11) {
                    StatisticItem_ProfileView(title: "Annonces actives", value: "6", icon: "newsGreen16")
                    StatisticItem_ProfileView(title: "Commandes", value: "14", icon: "cartGreen16")
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Favoris et alertes")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                        .foregroundColor(Color(hex: "#919191"))
                    VStack(spacing: 18) {
                        ArrowItem(title: "Favoris")
                        Divider()
                        ArrowItem(title: "List Alerts")
                    }
                    .padding(17)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "#FCFCFC"))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
                    )
                }
                .padding(.bottom, 12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Paramètres")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                        .foregroundColor(Color(hex: "#919191"))
                    VStack(spacing: 18) {
                        HStack {
                            Text("Langue")
                                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                                .foregroundColor(Color(hex: AppColor.textBlack).opacity(0.8))
                            Spacer()
                            Text("Français")
                                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                                .foregroundColor(Color(hex: AppColor.secondary))
                        }
                        Divider()
                        ArrowItem(title: "Paiements")
                        Divider()
                        ArrowItem(title: "Adresses enregistrées")
                        Divider()
                        Toggle("Notifications", isOn: $isNotficationPush)
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                            .foregroundColor(Color(hex: AppColor.textBlack).opacity(0.8))
                            .toggleStyle(CustomToggleStyle())
                        Divider()
                        ArrowItem(title: "Compte et sécurité")
                        Divider()
                        ArrowItem(title: "Confidentialité")
                    }
                    .padding(17)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "#FCFCFC"))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
                    )
                }
            }
            .padding(.bottom, 22)
        }
        .padding(.bottom, 100)
        .padding(.horizontal, 15)
    }
}

#Preview {
    ProfileView()
}
