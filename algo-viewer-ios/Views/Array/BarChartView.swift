//
//  BarChartView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

struct BarChartView: View {
    
    var title: String
    
    var body: some View {
        GeometryReader { geometry in
            let headHeight = geometry.size.height * 0.10
            VStack {
                ChartHeaderView(title: title, height: headHeight)
                ChartAreaView()
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(title: "This is a title")
    }
}
