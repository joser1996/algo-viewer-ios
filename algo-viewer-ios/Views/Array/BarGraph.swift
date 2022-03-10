//
//  BarGraph.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

struct BarGraph: View {
    var body: some View {
        VStack {
            Text("Bar Graph")
                .font(.title)
            BarChartView(title: "The Title")
                .frame(width: 300, height: 300, alignment: .center)
            //Spacer()
        }
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph()
    }
}
