//
//  TagFilterListView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct TagFilterListView: View {
    private var tags: [String] = ["Tout", "Pelotes & fils", "Patrons", "Aiguilles"]
    @State private var selectedTag: String = "Tout"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    tagItemView(tag: tag)
                }
            }
        }
        .frame(height: 38)
    }
    
    @ViewBuilder
    private func tagItemView(tag: String) -> some View {
        Button {
            selectedTag = tag
        } label: {
            Text(tag)
                .font(.customFont(name: FontName.raleway, size: 13, weightValue: selectedTag == tag ? 700 : 500))
                .foregroundColor(Color(hex: selectedTag == tag ? AppColor.secondary : "#040415"))
                .padding(.vertical, 11)
                .padding(.horizontal, 17)
                .background(
                    Capsule()
                        .fill(selectedTag == tag ? Color(hex: "#E9F1E7") : Color(hex: "#ECECEC"))
                )
                .overlay(
                    Capsule()
                        .stroke(Color(hex: selectedTag == tag ? AppColor.primary : "#ECECEC"), lineWidth: 1)
                )
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TagFilterListView()
        .padding()
}
