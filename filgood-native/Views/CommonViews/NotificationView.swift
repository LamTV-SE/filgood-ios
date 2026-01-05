//
//  NotificationView.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct NotificationView: View {
    private var notifications: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 25) {
                HStack {
                    Image("arrowLeftBlack16")
                    Spacer()
                }
                .padding(.horizontal, 15)
                Text("Notification")
                    .font(.customFont(name: FontName.raleway, size: 22, weightValue: 700))
                    .padding(.bottom, 40)
                    .padding(.horizontal, 15)
            }
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(notifications, id: \.self) { index in
                        NotificationItem_NotificationView()
                        
                        if index < notifications.count - 1 {
                            Divider()
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationView()
}
