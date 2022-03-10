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
    let algorithm: SortAlgorithms
    var data: [Int]
    let dataSize: Int
    
    init() {
        range = Bounds(lower: 0, upper: 100)
        ascending = true
        algorithm = SortAlgorithms.QuickSort
        data = []
        dataSize = 50
        for _ in 1...dataSize {
            data.append(Int.random(in: range.lower..<range.upper))
        }
        frames = Frame(data)
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
        let low: Int = 0
        let high: Int = self.dataSize - 1
        quickSort(low, high)
        self.frames.printFrames()
    }
}

//do mergesort stuff here
