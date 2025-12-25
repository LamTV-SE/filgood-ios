//
//  ImageCustomView.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import SwiftUI

struct ImageCustomView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: width)
            case let .success(image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
                    .cornerRadius(cornerRadius)
            case .failure:
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
                    .cornerRadius(cornerRadius)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 36, height: 36, cornerRadius: 0)
}
