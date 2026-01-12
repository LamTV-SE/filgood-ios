//
//  ChatView.swift
//  filgood-native
//
//  Created by Van Lam on 8/1/26.
//

import SwiftUI

struct ChatView: View {
    @State private var search: String = ""
    
    private let chats: [Int] = [0,1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Messagerie")
                    .font(.customFont(name: FontName.raleway, size: 22, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                SearchBarView(backgroundInput: "#F9F9F9", isShowFilter: false, text: $search)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(chats, id: \.self) {chat in
                    ChatListItem_ChatView()
                    Divider()
                        .padding(.horizontal, 15)
                }
                Spacer().frame(height: 15)
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    ChatView()
}
