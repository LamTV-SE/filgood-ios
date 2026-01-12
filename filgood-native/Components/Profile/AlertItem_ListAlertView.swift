//
//  AlertItem_ListAlertView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

struct AlertItem_ListAlertView: View {
    let onEdit: () -> Void
    let onDelete: () -> Void
    
    private let buttonWidth: CGFloat = 50
    private let spacing: CGFloat = 5
    private var totalActionWidth: CGFloat {
        buttonWidth * 2 + spacing + 10
    }
    private let tags: [String] = ["Mot clé : Mohair", "Couleur : Sauge", "Type : Fils", "Marque : Drops", "< 10 km"]
    
    @State private var offsetX: CGFloat = 0
    @State private var startOffsetX: CGFloat = 0
    
    init(
        onEdit: @escaping () -> Void,
        onDelete: @escaping () -> Void
    ) {
        self.onEdit = onEdit
        self.onDelete = onDelete
    }
    
    private func rubberBand(
        offset: CGFloat,
        limit: CGFloat,
        resistance: CGFloat = 0.25
    ) -> CGFloat {
        if offset < limit {
            return limit + (offset - limit) * resistance
        }
        return offset
    }
    
    @ViewBuilder
    private func AlertContentView() -> some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                HStack(spacing: 5) {
                    Image("bellOrange20")
                    Text("Mohair Sauge-10km")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                }
                Spacer()
                Text("Push")
                    .font(.customFont(name: FontName.raleway, size: 12, weightValue: 600))
                    .foregroundColor(Color(hex: "#436739"))
                    .padding(.vertical, 3)
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .fill(Color(hex: "#E7F9E2"))
                    )
            }
            FlowLayout(spacing: 5, rowSpacing: 5) {
                ForEach(tags, id: \.self) {item in
                    Text(item)
                        .font(.customFont(name: FontName.raleway, size: 12, weightValue: 500))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                        .padding(5)
                        .background(
                            Capsule()
                                .fill(Color(hex: "#E9E9E9").opacity(0.5))
                        )
                    
                }
            }
            HStack(spacing: 5) {
                Text("Fréquence:")
                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                    .foregroundColor(Color(hex: "#7E7F7E"))
                Text("Hebdomadaire")
                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                    .foregroundColor(Color(hex: AppColor.textBlack))
                Spacer()
            }
        }
        .padding(15)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        )
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            // 🔽 Action buttons
            HStack(spacing: spacing) {
                Button(action: onEdit) {
                    Image("editButton50")
                }
                Button(action: onDelete) {
                    Image("deleteButton50")
                }
            }
            
            // 🔼 Content
            AlertContentView()
                .background(Color.white)
                .offset(x: offsetX)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let translation = value.translation.width
                            let newOffset = startOffsetX + translation
                            
                            let limitedOffset = min(0, newOffset)
                            offsetX = rubberBand(
                                offset: limitedOffset,
                                limit: -totalActionWidth
                            )
                        }
                        .onEnded { _ in
                            withAnimation(.interactiveSpring(
                                response: 0.35,
                                dampingFraction: 0.85,
                                blendDuration: 0.25
                            )) {
                                offsetX = (-offsetX > totalActionWidth / 2)
                                ? -totalActionWidth
                                : 0
                            }
                            startOffsetX = offsetX
                        }
                )
        }
        .clipped()
    }
}


#Preview {
    AlertItem_ListAlertView( onEdit: { print("edit") },
                             onDelete: { print("delete") })
    .padding()
}
