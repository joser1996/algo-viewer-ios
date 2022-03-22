//
//  Sorter.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

//just dealing with integers
import Foundation

struct Bounds {
    let lower: Int
    let upper: Int
}

class Sorter {
    let frames: Frame //has data as well
    let range: Bounds
    let ascending: Bool
    var algorithm: SortAlgorithms
    var data: [Int]
    let dataSize: Int
    init() {
        range = Bounds(lower: 0, upper: 100)
        ascending = true
        algorithm = SortAlgorithms.MergeSort
        data = []
        dataSize = 100
        for _ in 1...dataSize {
            data.append(Int.random(in: range.lower..<range.upper))
        }
        frames = Frame(data)
    }
    
    func sortFrames() {
        switch self.algorithm {
        case SortAlgorithms.MergeSort:
            mergeSortFrames()
        case SortAlgorithms.QuickSort:
            quickSortFrames()
        }
    }
    
}


//all quicksort stuff
extension Sorter {
    private func partition(_ low: Int, _ high: Int) -> Int {
        let pivot: Int = frames.sortedCopy[high]
        var i: Int = low - 1
        for j in low...high-1 {
            if (frames.sortedCopy[j] < pivot) {
                i += 1
                frames.sortedCopy.swapAt(i, j)
                frames.insertFrame(frame: frames.sortedCopy)//probably just do this internally
            }
        }
        frames.sortedCopy.swapAt(i + 1, high)
        frames.insertFrame(frame: frames.sortedCopy)
        return i + 1
    }
    private func quickSort(_ low: Int, _ high: Int) {
        if (low < high) {
            let pi: Int = partition(low, high)
            quickSort(low, pi - 1)
            quickSort(pi + 1, high)
        }
    }

    func quickSortFrames() {
        if frames.frames.count > 1 {return}
        let low: Int = 0
        let high: Int = self.dataSize - 1
        quickSort(low, high)
        self.frames.printFrames()
    }
}

//do mergesort stuff here
extension Sorter {
    
    private func mmerge(_ left: Int, _ mid: Int, _ right: Int) {
        let arrOneSize = mid - left + 1
        let arrTwoSize = right - mid
        
        var leftArray: [Int] = [Int](repeating: 0, count: arrOneSize)
        var rightArray: [Int] = [Int](repeating: 0, count: arrTwoSize)
        for i in 0...arrOneSize-1 {
            leftArray[i] = frames.sortedCopy[left + i]
        }
        for i in 0...arrTwoSize-1 {
            rightArray[i] = frames.sortedCopy[mid + 1 + i]
        }
        
        var indexArrOne = 0
        var indexArrTwo = 0
        var indexMergedArray = left
        while (indexArrOne < arrOneSize && indexArrTwo < arrTwoSize) {
            if (leftArray[indexArrOne] <= rightArray[indexArrTwo]) {
                frames.sortedCopy[indexMergedArray] = leftArray[indexArrOne]
                frames.insertFrame(frame: frames.sortedCopy)
                indexArrOne += 1
            } else {
                frames.sortedCopy[indexMergedArray] = rightArray[indexArrTwo]
                frames.insertFrame(frame: frames.sortedCopy)
                indexArrTwo += 1
            }
            indexMergedArray += 1
        }
        
        while (indexArrOne < arrOneSize) {
            frames.sortedCopy[indexMergedArray] = leftArray[indexArrOne]
            frames.insertFrame(frame: frames.sortedCopy)
            indexArrOne += 1
            indexMergedArray += 1
        }
        
        while (indexArrTwo < arrTwoSize) {
            frames.sortedCopy[indexMergedArray] = rightArray[indexArrTwo]
            frames.insertFrame(frame: frames.sortedCopy)
            indexArrTwo += 1
            indexMergedArray += 1
        }
    }
    
    private func mergeSort(_ left: Int, _ right: Int) {
        if (left < right) {
            let mid = left + (right - left)/2
            mergeSort(left, mid)
            mergeSort(mid+1, right)
            mmerge(left, mid, right)
        }
    }
    
    func mergeSortFrames() {
        if frames.frames.count > 1 { return }
        let left: Int = 0
        let right: Int = self.dataSize - 1
        mergeSort(left, right)
        self.frames.printFrames()
    }
}
