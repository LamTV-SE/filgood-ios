//
//  SearchView.swift
//  filgood-native
//
//  Created by Van Lam on 26/12/25.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Rechercher")
                .font(.customFont(name: FontName.raleway, size: 22, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
                .padding(.bottom, 12)
            SearchBarView(backgroundInput: "#F9F9F9", text: $search)
                .padding(.bottom, 15)
            ScrollView(.vertical, showsIndicators: false) {
                ListProduct_Search()
                Spacer().frame(height: 15)
            }
            .padding(.bottom, 100)
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    SearchView()
}
