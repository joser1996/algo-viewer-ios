//
//  BarPlot.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import SwiftUI

struct BarPlot: View {
    let title: String
    let frame: Frame
    var body: some View {
        GeometryReader { gr in
            let headerHeight = gr.size.height * 0.05
            VStack {
                HeaderView(title: title, height: headerHeight)
                    .padding(.top, 10)
                PlotView(frames: frame)
            }
        }
    }
}

struct BarPlot_Previews: PreviewProvider {
    static var sorter = Sorter()
    static var previews: some View {
        BarPlot(title: "Quick Sort", frame: sorter.frames)
            .previewInterfaceOrientation(.portrait)
    }
}
