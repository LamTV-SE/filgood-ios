//
//  ReviewProduct_ProductDetail.swift
//  filgood-native
//
//  Created by Van Lam on 26/12/25.
//

import SwiftUI

struct ReviewProduct_ProductDetail: View {
    private let totalStars = 5
    private let userRatings: [Int] = [1, 2]
    
    var body: some View {
        VStack(spacing: 7) {
            HStack {
                Text("Avis sur le produit").font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                Spacer()
                HStack(spacing: 2) {
                    Text("Tout")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                        .foregroundColor(Color(hex: "#616161"))
                    Image("arrowRightGray19")
                }
            }
            HStack(spacing: 8) {
                Text("4.8")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                HStack(spacing: 2) {
                    ForEach(0..<totalStars, id: \.self) { _ in
                        Image("starGreen16")
                    }
                }
                Text("(32 avis)")
                    .font(.customFont(name: FontName.raleway, size: 12, weightValue: 400))
                    .foregroundColor(Color(hex: "#6D6D6D"))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            VStack {
                ForEach(userRatings, id: \.self) {user in
                    VStack(spacing: 0) {
                        HStack(alignment: .top, spacing: 5) {
                            ImageCustomView(
                                url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg",
                                width: 30,
                                height: 30,
                                cornerRadius: nil
                            )
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Oriane")
                                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                                    .foregroundColor(Color(hex: AppColor.textBlack))
                                
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt")
                                    .font(.customFont(name: FontName.raleway, size: 12, weightValue: 400))
                                    .foregroundColor(Color(hex: "#6D6D6D"))
                                
                                HStack(spacing: 6) {
                                    HStack(spacing: 2) {
                                        ForEach(0..<totalStars, id: \.self) { _ in
                                            Image("starGreen10")
                                        }
                                    }
                                    
                                    Divider().frame(height: 9)
                                    
                                    Text("23 min")
                                        .font(.customFont(name: FontName.raleway, size: 12, weightValue: 400))
                                        .foregroundColor(Color(hex: "#6D6D6D"))
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color(hex: "#E9E9E9"))
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewProduct_ProductDetail()
        .padding()
}
