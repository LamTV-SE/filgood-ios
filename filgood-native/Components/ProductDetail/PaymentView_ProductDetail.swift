//
//  PaymentView_ProductDetail.swift
//  filgood-native
//
//  Created by Van Lam on 26/12/25.
//

import SwiftUI

struct InfoItem: Identifiable {
    let id = UUID()
    let title: String
    let value: String
}

struct PaymentView_ProductDetail: View {
    private let paymentInfo: [InfoItem] = [
        InfoItem(title: "Remise en main propre", value: "Gratuit"),
        InfoItem(title: "Point relais (estimé)", value: "3€20"),
        InfoItem(title: "À domicile (estimé)", value: "5€40"),
        InfoItem(title: "Mode de paiement", value: "Carte (Stripe)")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Livraison et paiement")
                .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                .foregroundColor(Color(hex: AppColor.textBlack))
            VStack {
                ForEach(paymentInfo) {item in
                    paymentItemView(item: item, isLast: item.id == paymentInfo.last?.id)
                }
            }
            .background(Color(hex: "#FCFCFC").clipShape(RoundedRectangle(cornerRadius: 12)))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
            }
        }
    }
    
    @ViewBuilder
    private func paymentItemView(item: InfoItem, isLast: Bool) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text(item.title)
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
                    .foregroundColor(Color(hex: "#040415").opacity(0.8))
                Spacer()
                Text(item.value)
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                    .foregroundColor(Color(hex: AppColor.textBlack))
            }
            .padding(.vertical, 18)
            .padding(.horizontal, 20)
            if !isLast {
                Divider().frame(height: 1).background(Color(hex: "#E9E9E9"))
            }
        }
    }
}

#Preview {
    PaymentView_ProductDetail()
        .padding()
}
