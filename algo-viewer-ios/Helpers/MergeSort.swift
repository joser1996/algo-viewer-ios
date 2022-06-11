//
//  MergeSort.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/10/22.
//

import Foundation

class MergeSort: SortAlgorithm {
    
    init() {
        super.init(ascending: true, name: "Merge Sort")
    }
    
    private func myMerge(left: Int, mid: Int, right: Int) {
        let arrOneSize = mid - left + 1
        let arrTwoSize = right - mid
        
        var leftArray = [Int](repeating: 0, count: arrOneSize)
        var rightArray = [Int](repeating: 0, count: arrTwoSize)
        
        for i in 0...arrOneSize - 1 {
            leftArray[i] = inProgress[left + i]
        }
        
        for j in 0...arrTwoSize - 1 {
            rightArray[j] = inProgress[mid + 1 + j]
        }
        
        var indexOne = 0
        var indexTwo = 0
        var indexMerged = left
        
        while (indexOne < arrOneSize && indexTwo < arrTwoSize) {
            if (leftArray[indexOne] <= rightArray[indexTwo]) {
                inProgress[indexMerged] = leftArray[indexOne]
                indexOne += 1
            } else {
                inProgress[indexMerged] = rightArray[indexTwo]
                indexTwo += 1
            }
            steps.append(inProgress)
            indexMerged += 1
        }
        
        while (indexOne < arrOneSize) {
            inProgress[indexMerged] = leftArray[indexOne]
            steps.append(inProgress)
            indexOne += 1
            indexMerged += 1
        }
    
        while (indexTwo < arrTwoSize) {
            inProgress[indexMerged] = rightArray[indexTwo]
            steps.append(inProgress)
            indexTwo += 1
            indexMerged += 1
        }
    }
    
    private func myMergeSort(from left: Int, to right: Int) {
        if (left < right) {
            let mid = left + (right - left)/2
            myMergeSort(from: left, to: mid)
            myMergeSort(from: mid + 1, to: right)
            myMerge(left: left, mid: mid, right: right)
        }
    }
    
    override func sort(data: [Int]) -> [[Int]] {
        self.steps = []
        self.inProgress = data
        steps.append(data)
        myMergeSort(from: 0, to: data.count - 1)
        return steps
    }
}
