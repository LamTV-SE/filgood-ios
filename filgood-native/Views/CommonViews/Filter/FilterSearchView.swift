//
//  FilterSearchView.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct FilterSearchView: View {
    @State private var minValueQuantity: Double = 70
    @State private var maxValueQuantity: Double = 150
    @State private var minValuePrice: Double = 2
    @State private var maxValuePrice: Double = 25
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("arrowLeftBlack16")
                    Spacer()
                }
                .padding(.bottom, 25)
                HStack {
                    Text("Filtres")
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
                
                ArrowItem_FilterSearch(textLabel: "Marque",textValue: "Phildar, Madelinetosh, Drop Design", valueActive: true)
                Divider()
                ArrowItem_FilterSearch(textLabel: "Type de fil",textValue: "Coton", valueActive: true)
                Divider()
                ArrowItem_FilterSearch(textLabel: "Coloris",textValue: "Tout", valueActive: false)
                Divider()
                QuantityItem_FilterSearch()
                Divider()
                RangeItem_FilterSearch(minValue: $minValueQuantity, maxValue: $maxValueQuantity, label: "", currency: "g", pivotValue: 150.0, minimumDistance: 30.0, range: 0...300)
                Divider()
                ArrowItem_FilterSearch(textLabel: "Localisation",textValue: "Tout", valueActive: false)
                Divider()
                RangeItem_FilterSearch(minValue: $minValuePrice, maxValue: $maxValuePrice, label: "Prix", currency: "€", pivotValue: 25.0, minimumDistance: 5.0, range: 0...50)
                
                Spacer()
                VStack(spacing: 12) {
                    ButtonCustomView(title: "Créer une alerte", backgroundColor: "#E7F9E2", textColor: "#436739")
                    ButtonCustomView(title: "Afficher les résultats · 38")
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    FilterSearchView()
}
