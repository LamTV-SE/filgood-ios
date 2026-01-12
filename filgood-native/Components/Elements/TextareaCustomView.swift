//
//  TextareaCustomView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

struct TextareaCustomView: View {
    var placeholder: String = ""
    var isRequired: Bool? = false
    var height: CGFloat = 130
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            // Placeholder
            if text.isEmpty {
                HStack(spacing: 5) {
                    Image("chatGreen16")
                    Text(placeholder)
                        .font(.customFont(
                            name: FontName.raleway,
                            size: 14,
                            weightValue: 400
                        ))
                        .foregroundColor(Color(hex: "#919191"))
                }
                .padding(.top, 8)
                .padding(.leading, 5)
                .zIndex(1)
            }
            
            TextEditor(text: $text)
                .focused($isFocused)
                .font(.customFont(
                    name: FontName.raleway,
                    size: 14,
                    weightValue: 400
                ))
                .foregroundColor(Color(hex: AppColor.textBlack))
                .background(Color.white)
        }
        .padding(.top, 2)
        .padding(.leading, 5)
        .padding(.trailing, 10)
        .padding(.bottom, 10)
        .frame(height: height)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        )
        .onTapGesture {
            isFocused = true
        }
    }
    
}

#Preview {
    @Previewable @State var text = ""
    TextareaCustomView(placeholder: "Écrivez votre avis", text: $text)
        .padding()
}
