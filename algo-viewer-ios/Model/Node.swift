//
//  Node.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/19/22.
//

import Foundation
import CoreGraphics

typealias NodeID = UUID

struct Node: Identifiable {
    var id = UUID()
    var position: CGPoint = .zero
    var text = ""
    
    var visualId: String {
        return id.uuidString + "\(text.hashValue)"
    }
    
}

extension Node {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
}
