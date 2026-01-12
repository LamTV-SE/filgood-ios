//
//  EvaluateFormView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

fileprivate struct EvaluateItem: Identifiable {
    let id: UUID
    let title: String
    var isSelected: Bool
}

struct EvaluateFormView: View {
    let totalStar = 5
    
    @State private var text: String = ""
    @State private var evaluateDatas: [EvaluateItem] = [
        EvaluateItem(id: UUID(), title: "Excellent", isSelected: false),
        EvaluateItem(id: UUID(), title: "Satisfait", isSelected: false),
        EvaluateItem(id: UUID(), title: "Moyen", isSelected: false),
        EvaluateItem(id: UUID(), title: "Insatisfait", isSelected: false),
        EvaluateItem(id: UUID(), title: "Mauvais", isSelected: false),
    ]
    
    @ViewBuilder
    private func ProductInfoView() -> some View {
        HStack(spacing: 10) {
            ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 84, height: 84, cornerRadius: 8)
            VStack(alignment: .leading, spacing: 6) {
                Text("Mohair Sauge")
                    .font(.customFont(name: FontName.raleway, size: 16, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                HStack {
                    Text("3 pelotes")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                        .foregroundColor(Color(hex: AppColor.secondary))
                    Spacer()
                    Text("7€")
                        .font(.customFont(name: FontName.raleway, size: 16, weightValue: 700))
                        .foregroundColor(Color(hex: AppColor.secondary))
                }
                .padding(.bottom, 1)
                Text("Drops · Sauge · Mohair")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                    .foregroundColor(Color(hex: "#7E7F7E"))
            }
        }
    }
    
    @ViewBuilder
    private func FormView() -> some View {
        VStack(spacing: 16) {
            Text("Qualité du produit")
                .font(.customFont(name: FontName.raleway, size: 16, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
            HStack(spacing: 10) {
                ForEach(0..<totalStar, id: \.self) { index in
                    Image("starGreen30")
                }
            }
            FlowLayout(alignment: .center, rowSpacing: 10) {
                ForEach($evaluateDatas) { $item in
                    Text(item.title)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: item.isSelected ? 600 : 400))
                        .foregroundColor(Color(hex: item.isSelected ? AppColor.secondary : AppColor.textBlack))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .background(
                            Capsule()
                                .fill(Color(hex: item.isSelected ? AppColor.secondary : "#ECECEC").opacity(item.isSelected ? 0.1 : 0.5))
                        )
                        .onTapGesture {
                            item.isSelected.toggle()
                        }
                }
            }
            TextareaCustomView(placeholder: "Écrivez votre avis", text: $text)
        }
        .padding(15)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderMainView(title: "Évaluer le produit", isTitleLight: true)
            ProductInfoView()
                .padding(.bottom, 6)
            FormView()
            
            Spacer()
            ButtonCustomView(title: "Envoyer l’avis")
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    EvaluateFormView()
}
