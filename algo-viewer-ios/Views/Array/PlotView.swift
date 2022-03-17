//
//  PlotView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import SwiftUI

//Our canvas
struct PlotView: View {
    var data: [BarDataItem]
    var maxValue: Double {
        return Double(data.map{ $0.value }.max()!)
    }
    var body: some View {
        GeometryReader { gr in
            ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.black)
                HStack(spacing: 0) {
                    ForEach(data) { item in
                        BarView(value: Double(item.value), maxValue: maxValue, numberOfValues: item.numValues, maxBarHeight: gr.size.height, availableWidth: gr.size.width)
                    }
                }
            }
        }
    }
}

struct PlotView_Previews: PreviewProvider {
    static var sorter = Sorter()
    static var data: [BarDataItem] {
        let rawData = sorter.frames.getCurrentFrame()
        var barData = [BarDataItem]()
        for val in rawData {
            barData.append(BarDataItem(value: val, numValues: sorter.dataSize))
        }
        return barData
    }
    static var previews: some View {
        PlotView(data: data)
    }
}
