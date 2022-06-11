//
//  PlotView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import SwiftUI

//Our canvas
struct PlotView: View {
    @Binding var data: [Int]
    
    var maxValue: Double {
        return Double(data.map{ $0 }.max()!)
    }
    
    var barData: [BarDataItem] {
        var d = [BarDataItem]()
        for val in data {
            d.append(BarDataItem(value: val, numValues: data.count))
        }
        return d
    }
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.black)
                HStack(spacing: 0) {
                    ForEach(barData) { item in
                        BarView(value: Double(item.value), maxValue: maxValue, numberOfValues: item.numValues, maxBarHeight: gr.size.height, availableWidth: gr.size.width)
                    }
                }
            }
        }
    }
}

//struct PlotView_Previews: PreviewProvider {
//    @EnvironmentObject var md: Sorter
//    static var previews: some View {
//        PlotView(data: $md.currentFrame)
//    }
//}
