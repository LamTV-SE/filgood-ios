//
//  ProfileActiveListView.swift
//  filgood-native
//
//  Created by Van Lam on 9/1/26.
//

import SwiftUI

struct ProfileActiveListView: View {
    @State private var search: String = ""
    
    private let datas: [Int] = [0,1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderMainView(title: "Annonces actives", isTitleLight: true)
            SearchBarView(backgroundInput: "#F9F9F9", isShowFilter: false, text: $search)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    ForEach(datas, id: \.self) { item in
                        ActiveItem_ProfileActiveListView()
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ProfileActiveListView()
}
