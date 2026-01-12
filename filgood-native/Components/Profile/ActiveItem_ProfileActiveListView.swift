//
//  ActiveItem_ProfileActiveListView.swift
//  filgood-native
//
//  Created by Van Lam on 9/1/26.
//

import SwiftUI

struct ActiveItem_ProfileActiveListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("5 pelotes Coton Bio Blanc")
                .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
            HStack(alignment: .top, spacing: 7) {
                ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 40, height: 40, cornerRadius: 8)
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 5) {
                        Image("categoryGray12")
                        Text("Fil à crochet")
                            .font(.customFont(name: FontName.raleway, size: 13, weightValue: 500))
                            .foregroundColor(Color(hex: AppColor.textBlack))
                    }
                    Text("Drops · Sauge · Mohair")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    HStack(spacing: 5) {
                        Image("paintGray12")
                        Text("Red · Yellow · Blue")
                            .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                            .foregroundColor(Color(hex: "#7E7F7E"))
                    }
                    HStack {
                        HStack(spacing: 26) {
                            HStack(spacing: 4) {
                                Image("arrowLeftRightGray12")
                                Text("25 gram")
                                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                                    .foregroundColor(Color(hex: AppColor.textBlack))
                            }
                            HStack(spacing: 4) {
                                Image("hastagGray12")
                                Text("1000/1000")
                                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                                    .foregroundColor(Color(hex: AppColor.textBlack))
                            }
                        }
                        Spacer()
                        Text("7€")
                            .font(.customFont(name: FontName.raleway, size: 16, weightValue: 700))
                            .foregroundColor(Color(hex: AppColor.secondary))
                    }
                }
            }
        }
        .padding(15)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        )
    }
}

#Preview {
    ActiveItem_ProfileActiveListView()
        .padding()
}
