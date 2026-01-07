//
//  HeaderMainView.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import SwiftUI

struct HeaderMainView: View {
    let title: String
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("arrowLeftBlack16")
                Spacer()
            }
            .padding(.bottom, 25)
            HStack {
                Text(title)
                    .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
                    .padding(.bottom, 15)
                Spacer()
            }
        }
    }
}

#Preview {
    HeaderMainView(title: "Nouvelle alerte")
        .padding(.horizontal, 15)
}
