//
//  OTPInputView.swift
//  filgood-native
//
//  Created by Van Lam on 27/12/25.
//

import SwiftUI

struct OTPInputView: View {
    @State private var code: [String] = Array(repeating: "", count: 4)
    @FocusState private var focusedIndex: Int?
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<4, id: \.self){ index in
                TextField("", text: $code[index])
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .frame(width: 50, height: 50)
                    .background(code[index] != "" ? Color(hex: AppColor.secondary).opacity(0.1) : .white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(hex: code[index] != "" ? AppColor.secondary : "#E9E9E9"), lineWidth: 1)
                    }
                    .focused($focusedIndex, equals: index)
                    .onChange(of: code[index]) { oldValue, newValue in
                        
                        // Only enter number
                        let filtered = newValue.filter {"0123456789".contains($0)}
                        if filtered != newValue {
                            code[index] = filtered
                        }
                        
                        // Only 1 character
                        if filtered.count > 1 {
                            code[index] = String(filtered.prefix(1))
                        }
                        
                        // Auto focus
                        if filtered.count == 1, index < 3 {
                            focusedIndex = index + 1
                        }
                        
                        // Auto back when empty
                        if filtered.isEmpty, oldValue.count == 1 {
                            if index > 0 {
                                focusedIndex = index - 1
                            }
                        }
                    }
            }
        }
        .onAppear {
            focusedIndex = 0
        }
    }
}

#Preview {
    OTPInputView()
}
