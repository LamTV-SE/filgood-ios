//
//  CustomToggleStyle.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import Foundation
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            Capsule()
                .fill(configuration.isOn ? Color(hex: AppColor.secondary) : Color(hex: "#E9E9E9"))
                .frame(width: 43, height: 27)
                .overlay(
                    Circle()
                        .fill(Color(hex: AppColor.white))
                        .frame(width: 21, height: 21)
                        .offset(x: configuration.isOn ? 8: -8)
                        .animation(.easeInOut(duration: 0.3), value: configuration.isOn)
                )
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

#Preview {
    @Previewable @State var isPushNotification: Bool = false
    
    Toggle("Push", isOn: $isPushNotification)
        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
        .foregroundColor(Color(hex: AppColor.textBlack))
        .toggleStyle(CustomToggleStyle())
        .padding()
}
