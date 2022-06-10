//
//  Sorter.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

//just dealing with integers
import Foundation

class Sorter {
    var frames: [[Int]]
    var currentIndex: Int
    var range: (low: Int, upper: Int)
    var algorithm: SortAlgorithm
    var data: [Int]
    let dataSize: Int
    
    init() {
        range = (low: 0, upper: 100)
        algorithm = QuickSort()
        data = []
        dataSize = 100
        for _ in 1...dataSize {
            data.append(Int.random(in: range.low..<range.upper))
        }
        frames = []
        currentIndex = 0
    }
    
    func sortFrames() {
        self.frames = algorithm.sort(data: data)
    }
    
    func getCurrentFrame() -> [Int]? {
        if (currentIndex >= frames.count) { return nil }
        return frames[currentIndex]
    }
    
    func updateFrame() -> Bool {
        currentIndex += 1
        if (currentIndex >= frames.count) { return false }
        return true
    }
    
    func resetFrame() {
        currentIndex = 0
    }
    
    
    
}


//THIS is UGLY define each sorting algorithm behavior in own class
//
//all quicksort stuff

//do mergesort stuff here
//extension Sorter {
//
//    private func mmerge(_ left: Int, _ mid: Int, _ right: Int) {
//        let arrOneSize = mid - left + 1
//        let arrTwoSize = right - mid
//
//        var leftArray: [Int] = [Int](repeating: 0, count: arrOneSize)
//        var rightArray: [Int] = [Int](repeating: 0, count: arrTwoSize)
//        for i in 0...arrOneSize-1 {
//            leftArray[i] = frames.sortedCopy[left + i]
//        }
//        for i in 0...arrTwoSize-1 {
//            rightArray[i] = frames.sortedCopy[mid + 1 + i]
//        }
//
//        var indexArrOne = 0
//        var indexArrTwo = 0
//        var indexMergedArray = left
//        while (indexArrOne < arrOneSize && indexArrTwo < arrTwoSize) {
//            if (leftArray[indexArrOne] <= rightArray[indexArrTwo]) {
//                frames.sortedCopy[indexMergedArray] = leftArray[indexArrOne]
//                frames.insertFrame(frame: frames.sortedCopy)
//                indexArrOne += 1
//            } else {
//                frames.sortedCopy[indexMergedArray] = rightArray[indexArrTwo]
//                frames.insertFrame(frame: frames.sortedCopy)
//                indexArrTwo += 1
//            }
//            indexMergedArray += 1
//        }
//
//        while (indexArrOne < arrOneSize) {
//            frames.sortedCopy[indexMergedArray] = leftArray[indexArrOne]
//            frames.insertFrame(frame: frames.sortedCopy)
//            indexArrOne += 1
//            indexMergedArray += 1
//        }
//
//        while (indexArrTwo < arrTwoSize) {
//            frames.sortedCopy[indexMergedArray] = rightArray[indexArrTwo]
//            frames.insertFrame(frame: frames.sortedCopy)
//            indexArrTwo += 1
//            indexMergedArray += 1
//        }
//    }
//
//    private func mergeSort(_ left: Int, _ right: Int) {
//        if (left < right) {
//            let mid = left + (right - left)/2
//            mergeSort(left, mid)
//            mergeSort(mid+1, right)
//            mmerge(left, mid, right)
//        }
//    }
//
//    func mergeSortFrames() {
//        if frames.frames.count > 1 { return }
//        let left: Int = 0
//        let right: Int = self.dataSize - 1
//        mergeSort(left, right)
//        self.frames.printFrames()
//    }
//}
