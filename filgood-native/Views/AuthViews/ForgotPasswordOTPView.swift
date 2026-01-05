//
//  ForgotPasswordOTP.swift
//  filgood-native
//
//  Created by Van Lam on 27/12/25.
//

import SwiftUI

struct ForgotPasswordOTPView: View {
    
    private var descriptionText: AttributedString {
        var result = AttributedString("Un code OTP a été envoyé au ")
        
        var email = AttributedString("example\u{200B}@gmail.com")
        email.foregroundColor = Color(hex: AppColor.textBlack)
        email.font = .customFont(name: FontName.raleway, size: 14, weightValue: 600)
        
        var tail = AttributedString(", veuillez remplir le formulaire.")
        tail.foregroundColor = Color(hex: "#6D6D6D")
        
        result.append(email)
        result.append(tail)
        
        return result
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("arrowLeftBlack16")
                Spacer()
            }
            .padding(.bottom, 25)
            Text("Vérification OTP")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
                .padding(.bottom, 40)
            VStack(spacing: 25) {
                Image("forgotPasswordOTP")
                Text(descriptionText)
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                    .multilineTextAlignment(.center)
                OTPInputView()
                HStack(spacing: 4) {
                    Text("Vous n’avez pas reçu le code?")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    Text("Renvoyer à nouveau?")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.secondary))
                }
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            ButtonCustomView(title: "Vérifier")
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ForgotPasswordOTPView()
}
