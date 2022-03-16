//
//  PlotView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import SwiftUI

//Our canvas
struct PlotView: View {
    var frames: Frame
    var data: [BarDataItem] {
        let currentFrame = frames.frames[0]
        var data = [BarDataItem]()
        for val in currentFrame {
            data.append(BarDataItem(value: val, numValues: currentFrame.count))
        }
        return data
    }
    var maxValue: Double {
        let currentFrame = frames.frames[0]
        let maxValue = currentFrame.map { $0 }.max()!
        return Double(maxValue)
    }
    
    var body: some View {
        GeometryReader { gr in
            
            ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.black)
                //.fill(Color(#colorLiteral(red: 235, green: 227, blue: 204, alpha: 1)))
                    //.fill(Color(#colorLiteral(red: 0, green: 1, blue: 0.9399639964, alpha: 1)))
                    
                HStack(spacing: 0) {
                    ForEach(data) { item in
                        BarView(value: Double(item.value), maxValue: maxValue, numberOfValues: frames.frames[0].count, maxBarHeight: gr.size.height, availableWidth: gr.size.width)
                    }
                }
            }
        }
    }
}

struct PlotView_Previews: PreviewProvider {
    static var sorter = Sorter()
    static var previews: some View {
        PlotView(frames: sorter.frames)
    }
}
