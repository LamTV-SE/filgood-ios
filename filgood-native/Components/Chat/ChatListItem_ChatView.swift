//
//  ChatListItem_ChatView.swift
//  filgood-native
//
//  Created by Van Lam on 8/1/26.
//

import SwiftUI

struct ChatListItem_ChatView: View {
    var body: some View {
        HStack(spacing: 10) {
            ZStack(alignment: .bottomTrailing) {
                ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 48, height: 48, cornerRadius: 24)
                Circle()
                    .fill(Color(hex: "#7CA072"))
                    .frame(width: 6, height: 6)
                    .overlay(Circle().stroke(Color(hex: "#F4F8F3"), lineWidth: 1))
                    .offset(x: -6)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Oriane")
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
    ChatListItem_ChatView()
}
