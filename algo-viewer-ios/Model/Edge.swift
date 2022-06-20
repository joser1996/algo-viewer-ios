//
//  Edge.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/19/22.
//

import Foundation
import CoreGraphics

struct Edge: Identifiable {
    var id = UUID()
    var start: NodeID
    var end: NodeID
}

struct EdgeProxy: Identifiable {
    var id: UUID
    var start: CGPoint
    var end: CGPoint
}

extension Edge {
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end
    }
}
