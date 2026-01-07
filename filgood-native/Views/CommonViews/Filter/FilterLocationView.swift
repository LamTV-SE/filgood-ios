//
//  FilterLocationView.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import SwiftUI

struct FilterLocationView: View {
    @State private var search: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderMainView(title: "Localisation")
            SearchLocationBar_FilterSearch(text: $search)
            Spacer()
            ButtonCustomView(title: "Enregistrer")
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    FilterLocationView()
}
