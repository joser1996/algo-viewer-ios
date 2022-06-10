//
//  SortAlgorithm.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/9/22.
//

import Foundation

protocol SortProtocol {
    func sort(data: [Int]) ->[[Int]]
}

class SortAlgorithm: SortProtocol {
    func sort(data: [Int]) -> [[Int]] {
        fatalError("Must overrid")
    }
    var ascending: Bool
    
    init(ascending: Bool = true) {
        self.ascending = ascending
    }
}
