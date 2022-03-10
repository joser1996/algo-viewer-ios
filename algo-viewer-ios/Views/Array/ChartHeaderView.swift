//
//  ChartHeaderView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

struct ChartHeaderView: View {
    var title: String
    var height: CGFloat
    
    var body: some View {
        Text(title)
            .frame(height: height)
    }
}

struct ChartHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChartHeaderView(title: "WUT", height: 300)
    }
}
