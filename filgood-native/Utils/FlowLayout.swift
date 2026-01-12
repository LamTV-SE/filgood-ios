//
//  FlowLayout.swift
//  filgood-native
//
//  Created by Van Lam on 7/1/26.
//

import Foundation
import SwiftUICore
import SwiftUI

struct FlowLayout: Layout {
    enum Alignment {
        case leading
        case center
        case trailing
    }
    
    var alignment: Alignment = .leading
    var spacing: CGFloat = 8
    var rowSpacing: CGFloat = 8
    
    // MARK: - Size
    
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var currentRowWidth: CGFloat = 0
        var rowHeight: CGFloat = 0
        var totalHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if currentRowWidth + size.width > maxWidth {
                totalHeight += rowHeight + rowSpacing
                currentRowWidth = 0
                rowHeight = 0
            }
            
            currentRowWidth += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
        
        totalHeight += rowHeight
        return CGSize(width: maxWidth, height: totalHeight)
    }
    
    // MARK: - Layout
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        let maxWidth = bounds.width
        var rows: [[(LayoutSubview, CGSize)]] = [[]]
        var currentRowWidth: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if currentRowWidth + size.width > maxWidth {
                rows.append([])
                currentRowWidth = 0
            }
            
            rows[rows.count - 1].append((subview, size))
            currentRowWidth += size.width + spacing
        }
        
        var y = bounds.minY
        
        for row in rows {
            let rowWidth =
            row.map { $0.1.width }.reduce(0, +)
            + spacing * CGFloat(max(row.count - 1, 0))
            
            let rowHeight = row.map { $0.1.height }.max() ?? 0
            
            let xStart: CGFloat
            switch alignment {
            case .leading:
                xStart = bounds.minX
            case .center:
                xStart = bounds.midX - rowWidth / 2
            case .trailing:
                xStart = bounds.maxX - rowWidth
            }
            
            var x = xStart
            
            for (subview, size) in row {
                subview.place(
                    at: CGPoint(x: x, y: y),
                    proposal: ProposedViewSize(size)
                )
                x += size.width + spacing
            }
            
            y += rowHeight + rowSpacing
        }
    }
}
