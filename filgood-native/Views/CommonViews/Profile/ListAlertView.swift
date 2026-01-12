//
//  ListAlertView.swift
//  filgood-native
//
//  Created by Van Lam on 12/1/26.
//

import SwiftUI

struct ListAlertView: View {
    private let datas: [Int] = [0,1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderMainView(title: "List Alerts", isTitleLight: true)
            List {
                ForEach(datas, id: \.self) { item in
                    AlertItem_ListAlertView(
                        onEdit: {
                            print("Edit \(item)")
                        },
                        onDelete: {
                            print("Delete \(item)")
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ListAlertView()
}
