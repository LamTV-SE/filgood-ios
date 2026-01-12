//
//  ChatDetailItem_ChatDetailView.swift
//  filgood-native
//
//  Created by Van Lam on 8/1/26.
//

import SwiftUI

struct ChatDetailItem_ChatDetailView: View {
    private let maxWidthItem = UIScreen.main.bounds.width - 117
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 6) {
            Text("Super, merci ! Vous pouvez m’envoyer une photo de l’étiquette?")
                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                .foregroundColor(Color(hex: AppColor.white))
                .padding(.vertical, 8)
                .padding(.leading, 10)
                .padding(.trailing, 16)
                .background(
                    RoundedCorner(
                        radius: 12,
                        corners: [.topLeft, .topRight, .bottomLeft]
                    )
                    .fill(Color(hex: AppColor.secondary))
                )
                .frame(maxWidth: maxWidthItem, alignment: .trailing)
            Text("10:44")
                .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                .foregroundColor(Color(hex: "#8A8A8A"))
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    ChatDetailItem_ChatDetailView()
        .padding()
}
