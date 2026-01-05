//
//  RangeItem_FilterSearch.swift
//  filgood-native
//
//  Created by Van Lam on 5/1/26.
//

import SwiftUI

struct RangeItem_FilterSearch: View {
    @Binding var minValue: Double
    @Binding var maxValue: Double
    
    let label: String
    let currency: String
    let pivotValue: Double
    let minimumDistance: Double
    let range: ClosedRange<Double>
    let trackHeight: CGFloat = 4
    let thumbSize: CGFloat = 12
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                if label != "" {
                    Text(label)
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                }
                Spacer()
                Text("\(intText(minValue))\(currency) - \(intText(maxValue))\(currency)")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 600))
                    .foregroundColor(Color(hex: AppColor.secondary))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            GeometryReader { geo in
                let width = geo.size.width
                
                ZStack(alignment: .leading) {
                    
                    // MARK: track background
                    Capsule()
                        .fill(Color(hex: "#E9E9E9"))
                        .frame(height: trackHeight)
                    
                    // MARK: track active
                    Capsule()
                        .fill(Color(hex: AppColor.secondary))
                        .frame(width: maxX(width) - minX(width), height: trackHeight)
                        .offset(x: minX(width))
                    
                    thumb.offset(x: minX(width) - thumbSize / 2)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    let percent = min(max(0, value.location.x / width), pivotPercent)
                                    let newMin = valueFrom(percent).rounded()
                                    
                                    if newMin <= maxValue - minimumDistance {
                                        minValue = newMin
                                    }
                                })
                        )
                    
                    thumb.offset(x: maxX(width) - thumbSize / 2)
                        .gesture(
                            DragGesture()
                                .onChanged({value in
                                    let percent = max(min(1, value.location.x / width), pivotPercent)
                                    let newMax = valueFrom(percent).rounded()
                                    
                                    if newMax >= minValue + minimumDistance {
                                        maxValue = newMax
                                    }
                                })
                        )
                    
                    Text("\(Int(minValue))\(currency)")
                        .font(.customFont(
                            name: FontName.raleway,
                            size: 13,
                            weightValue: 500
                        ))
                        .foregroundColor(Color(hex: "#616161"))
                        .offset(x: minX(width) - thumbSize / 2, y: 24)
                    
                    Text("\(Int(maxValue))\(currency)")
                        .font(.customFont(
                            name: FontName.raleway,
                            size: 13,
                            weightValue: 500
                        ))
                        .foregroundColor(Color(hex: "#616161"))
                        .offset(x: maxX(width) - thumbSize / 2, y: 24)
                }
                .frame(height: thumbSize)
            }
            .frame(height: 39)
        }
        .padding(.vertical, 15)
    }
}

extension RangeItem_FilterSearch {
    
    var minValuePercent: Double {
        (minValue - range.lowerBound) /
        (range.upperBound - range.lowerBound)
    }
    
    var maxValuePercent: Double {
        (maxValue - range.lowerBound) /
        (range.upperBound - range.lowerBound)
    }
    
    func minX(_ width: CGFloat) -> CGFloat {
        CGFloat(minValuePercent) * width
    }
    
    func maxX(_ width: CGFloat) -> CGFloat {
        CGFloat(maxValuePercent) * width
    }
    
    func valueFrom(_ percent: Double) -> Double {
        range.lowerBound +
        percent * (range.upperBound - range.lowerBound)
    }
    
    var thumb: some View {
        Circle()
            .fill(Color.white)
            .frame(width: thumbSize, height: thumbSize)
            .shadow(radius: 2)
    }
    
    var pivotPercent: Double {
        (pivotValue - range.lowerBound) /
        (range.upperBound - range.lowerBound)
    }
    
    func intText(_ value: Double) -> String {
        String(Int(value.rounded()))
    }
}


#Preview {
    @Previewable @State var minValue: Double = 70
    @Previewable @State var maxValue: Double = 150
    
    RangeItem_FilterSearch(minValue: $minValue, maxValue: $maxValue, label: "", currency: "g", pivotValue: 150.0, minimumDistance: 30.0, range: 0...300)
}
