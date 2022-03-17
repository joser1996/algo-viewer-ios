//
//  BarPlot.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import SwiftUI

struct BarPlot: View {
    let title: String
    @EnvironmentObject var md: ModelData
    var body: some View {
        GeometryReader { gr in
            let headerHeight = gr.size.height * 0.05
            VStack {
                HeaderView(title: title, height: headerHeight)
                    .padding(.top, 10)
                PlotView(data: md.currentFrame)
            }
        }
    }
}

struct BarPlot_Previews: PreviewProvider {
    static var sorter = Sorter()
    static var currentFrame: [BarDataItem] {
        let rawData = sorter.frames.getCurrentFrame()
        var barData = [BarDataItem]()
        for val in rawData {
            barData.append(BarDataItem(value: val, numValues: sorter.dataSize))
        }
        return barData
    }
    static var previews: some View {
        BarPlot(title: "Quick Sort")
            .environmentObject(ModelData())
            .previewInterfaceOrientation(.portrait)
    }
}
