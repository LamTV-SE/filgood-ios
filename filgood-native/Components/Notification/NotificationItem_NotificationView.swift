//
//  NotificationItem_NotificationView.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct NotificationItem_NotificationView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image("heartBorder20")
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Mohair Rose")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                    Spacer()
                    Text("23 min")
                        .font(.customFont(name: FontName.raleway, size: 12, weightValue: 400))
                        .foregroundColor(Color(hex: "#6D6D6D"))
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ")
                    .font(.customFont(name: FontName.raleway, size: 12, weightValue: 400))
                    .foregroundColor(Color(hex: "#6D6D6D"))
            }
        }
        .padding(15)
    }
}

#Preview {
    NotificationItem_NotificationView()
}
