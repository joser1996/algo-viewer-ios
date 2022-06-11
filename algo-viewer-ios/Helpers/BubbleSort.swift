//
//  BubbleSort.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/11/22.
//

import Foundation

class BubbleSort: SortAlgorithm {
    init() {
        super.init(ascending: true, name: "Bubble Sort")
    }
    
    private func bubbleSort() {
        let n = self.inProgress.count
        for i in 0 ..< n - 1 {
            for j in 0 ..< n - i - 1 {
                if (inProgress[j] > inProgress[j + 1]) {
                    inProgress.swapAt(j, j + 1)
                    steps.append(inProgress)
                }
            }
        }
    }
    
    override func sort(data: [Int]) -> [[Int]] {
        self.steps = []
        self.inProgress = data
        steps.append(data)
        bubbleSort()
        return steps
    }
}
