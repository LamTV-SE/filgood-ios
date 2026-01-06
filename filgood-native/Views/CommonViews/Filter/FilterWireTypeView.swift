//
//  FilterWireTypeView.swift
//  filgood-native
//
//  Created by Van Lam on 6/1/26.
//

import SwiftUI

fileprivate struct WireType: Identifiable {
    let id = UUID()
    let name: String
    var isChecked: Bool
}

struct FilterWireTypeView: View {
    @State private var search: String = ""
    
    @State private var wireTypes: [WireType] = [
        WireType(name: "Coton", isChecked: false),
        WireType(name: "Lin", isChecked: false),
        WireType(name: "Bambou", isChecked: false),
        WireType(name: "Chanvre", isChecked: false),
        WireType(name: "Laine", isChecked: false),
        WireType(name: "Alpaga", isChecked: false),
        WireType(name: "Mohair", isChecked: false),
        WireType(name: "Cachemire", isChecked: false),
        WireType(name: "Angora", isChecked: false),
        WireType(name: "Acrylique", isChecked: false),
    ]
    
    private var filteredWireTypes: Binding<[WireType]> {
        Binding(
            get: {
                if search.isEmpty {
                    return wireTypes
                }
                return wireTypes.filter{
                    $0.name.localizedCaseInsensitiveContains(search)
                }
            },
            set: { newValue in
                wireTypes = newValue
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
                        ForEach(filteredWireTypes) {$wireType in
                            SingleItem_Filter(label: wireType.name, isChecked: $wireType.isChecked)
                            
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
    FilterWireTypeView()
}
