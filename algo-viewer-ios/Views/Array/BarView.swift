//
//  BarView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import SwiftUI

struct BarView: View {
    let value: Double
    let maxValue: Double
    let numberOfValues: Int
    let maxBarHeight: Double
    let availableWidth: CGFloat
    //Modify the width
    var body: some View {
        let barHeight = (value/maxValue) * maxBarHeight
        let barWidth = Double(Double(availableWidth) / Double(numberOfValues))
        VStack {
            Spacer()
            Rectangle()
                .fill(.red)
                .border(Color.gray, width: 1)
                .frame(width: barWidth, height: barHeight)
        }.frame(width: barWidth)
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: 1, maxValue: 10, numberOfValues: 1, maxBarHeight: 200, availableWidth: 400)
    }
}
