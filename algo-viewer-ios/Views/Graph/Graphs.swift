//
//  Graphs.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

let squareSize: CGFloat = 10

struct Square: View {
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .frame(width: squareSize, height: squareSize, alignment: .center)
            .foregroundColor(color)
    }
}

struct Graphs: View {
    static let spacingDesired: CGFloat = 25
    
    let rows = [
        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center)
    ]
    
    
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: Graphs.spacingDesired, pinnedViews: []) {
            ForEach (0 ..< 50) {_ in
                Square(color: .red)
            }
        }
    }
}

struct Graphs_Previews: PreviewProvider {
    static var previews: some View {
        Graphs()
    }
}
