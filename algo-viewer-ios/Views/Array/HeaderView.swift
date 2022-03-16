//
//  HeaderView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let height: CGFloat
    var body: some View {
        Text(title)
            .font(.title)
            .frame(height: height)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", height: 100.0)
    }
}
