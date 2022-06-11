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
    
    var name: String
    var ascending: Bool
    var inProgress: [Int] = []
    var steps: [[Int]] = []
    
    init(ascending: Bool = true, name: String = "N/A") {
        self.ascending = ascending
        self.name = name
    }
}
