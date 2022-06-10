//
//  QuickSort.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/9/22.
//

import Foundation

class QuickSort: SortAlgorithm {
    var inProgress: [Int] = []
    var steps: [[Int]] = []
    let original = 0
    
    private func partition(_ left: Int, _ right: Int) -> Int {
        let pivot = inProgress[right]
        var i = left - 1
        
        for j in left...right - 1 {
            if (inProgress[j] < pivot) {
                i += 1
                inProgress.swapAt(i, j)
                steps.append(inProgress)
            }
        }
        
        i += 1
        inProgress.swapAt(i, right)
        steps.append(inProgress)
        return i
    }
    
    private func quickSort(_ left: Int, _ right: Int) {
        if (left <= right) {
            let pivotIndex = partition(left, right)
            quickSort(left, pivotIndex - 1)
            quickSort(pivotIndex + 1, right)
        }
    }
    
    override func sort(data: [Int]) -> [[Int]] {
        self.steps = []
        self.inProgress = data
        steps.append(data)
        quickSort(0, data.count - 1)
        
        return steps
    }
}
