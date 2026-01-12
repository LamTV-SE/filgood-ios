//
//  ChatBox_ChatDetailView.swift
//  filgood-native
//
//  Created by Van Lam on 8/1/26.
//

import SwiftUI

struct ChatBox_ChatDetailView: View {
    @State private var text: String = ""
    
    var body: some View {
        HStack(spacing: 15) {
            TextField("Écrire un message...", text: $text)
            Image("fileGray18")
            Image("emojiGray18")
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 17)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "#E5E5E5"), lineWidth: 1)
        )
        
    }
}

#Preview {
    ChatBox_ChatDetailView()
        .padding()
}
