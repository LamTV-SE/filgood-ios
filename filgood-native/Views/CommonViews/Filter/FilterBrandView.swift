//
//  FilterBrandView.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct FilterBrandView: View {
    @State private var search: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("arrowLeftBlack16")
                    Spacer()
                }
                .padding(.bottom, 25)
                HStack {
                    Text("Marque")
                        .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
                    Spacer()
                    HStack(spacing: 4) {
                        Image("cancelCircleGray16")
                        Text("Supprimer tout")
                            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                            .underline()
                            .foregroundColor(Color(hex: "#919191"))
                    }
                }
                .padding(.bottom, 15)
                SearchBarView(isShowFilter: false, text: $search)
                Spacer()
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    FilterBrandView()
}
