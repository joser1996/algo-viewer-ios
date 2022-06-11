//
//  SortAlgorithmFactory.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/11/22.
//

import Foundation

class SortAlgorithmFactory {
    
    static func buildAlgorithm(of type: SortAlgorithms) -> SortAlgorithm {
        switch type {
        case .QuickSort:
            return QuickSort()
        case .MergeSort:
            return MergeSort()
        }
    }
}
