//
//  LanguageSheetView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

enum LanguageType {
    case french
    case english
}

fileprivate struct Language: Identifiable {
    let id: UUID
    let label: String
    let icon: String
    let value: LanguageType
}

struct LanguageSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedLanguage: LanguageType = .french
    
    private let languagesData: [Language] = [
        Language(id: UUID(), label: "French", icon: "frenchFlag", value: .french),
        Language(id: UUID(), label: "English", icon: "englishFlag", value: .english),
    ]
    
    @ViewBuilder
    private func LanguageItemView(item: Language) -> some View {
        HStack {
            HStack(spacing: 10) {
                Image(item.icon)
                Text(item.label)
                    .font(.customFont(name: FontName.raleway, size: 16, weightValue: 600))
            }
            Spacer()
            CheckCircleCustomView(
                isChecked: Binding(
                    get: { item.value == selectedLanguage },
                    set: { newValue in
                        if newValue {
                            selectedLanguage = item.value
                        }
                    }
                )
            )
        }
        .padding(15)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: item.value == selectedLanguage ? AppColor.secondary : "#E9E9E9"), lineWidth: 1)
        )
    }
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image("closeGray18")
                }
            }
            Text("Langue")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
                .padding(.bottom, 19)
            ForEach(languagesData) {item in
                LanguageItemView(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedLanguage = item.value
                    }
                    .padding(.bottom, 9)
            }
        }
        .padding(.horizontal, 15)
        .presentationDetents([.height(265)])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    Color.clear
        .sheet(isPresented: .constant(true)) {
            LanguageSheetView()
        }
}
