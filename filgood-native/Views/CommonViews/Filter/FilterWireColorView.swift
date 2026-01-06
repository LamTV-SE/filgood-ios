//
//  FilterWireColorView.swift
//  filgood-native
//
//  Created by Van Lam on 6/1/26.
//

import SwiftUI

fileprivate struct WireColor: Identifiable {
    let id = UUID()
    let name: String
    let color: String
    var isChecked: Bool
}

struct FilterWireColorView: View {
    @State private var search: String = ""
    
    @State private var wireColors: [WireColor] = [
        WireColor(name: "Blanc", color: AppColor.white, isChecked: false),
        WireColor(name: "Noir", color: "#000000", isChecked: false),
        WireColor(name: "Marron", color: "#804C4C", isChecked: false),
        WireColor(name: "Gris", color: "#D9D9D9", isChecked: false),
        WireColor(name: "Beige", color: "#F1E4E4", isChecked: false),
        WireColor(name: "Doré", color: "#CDAC40", isChecked: false),
        WireColor(name: "Rouge", color: "#E45932", isChecked: false),
        WireColor(name: "Bordeaux", color: "#851D00", isChecked: false),
        WireColor(name: "Fuschia", color: "#E4099B", isChecked: false),
        WireColor(name: "Bleu", color: "#5475E1", isChecked: false),
    ]
    
    private var filteredWireColors: Binding<[WireColor]> {
        Binding(
            get: {
                if search.isEmpty {
                    return wireColors
                }
                return wireColors.filter{
                    $0.name.localizedCaseInsensitiveContains(search)
                }
            },
            set: { newValue in
                wireColors = newValue
            }
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("arrowLeftBlack16")
                    Spacer()
                }
                .padding(.bottom, 25)
                HStack {
                    Text("Type de fil")
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
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(filteredWireColors) {$wireColor in
                            SingleItem_Filter(label: wireColor.name, isColor: true, color: wireColor.color, isChecked: $wireColor.isChecked)
                                .padding(.horizontal, 1)
                            
                            Divider()
                        }
                    }
                }
                Spacer()
                ButtonCustomView(title: "Enregistrer")
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    FilterWireColorView()
}
