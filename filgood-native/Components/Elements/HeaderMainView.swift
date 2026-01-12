//
//  HeaderMainView.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import SwiftUI

struct HeaderMainView: View {
    @Environment(\.dismiss) private var dismiss
    
    let title: String
    var isTitleLight: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("arrowLeftBlack16")
                }
                Spacer()
            }
            .padding(.bottom, 25)
            HStack {
                Text(title)
                    .font(.customFont(name: FontName.raleway, size: 22, weightValue: isTitleLight ? 600 : 700))
                Spacer()
            }
        }
    }
}

#Preview {
    HeaderMainView(title: "Nouvelle alerte")
        .padding(.horizontal, 15)
}
