//
//  Sorter.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

//just dealing with integers
import Foundation

final class Sorter: ObservableObject {
    @Published var currentFrame: [Int]
    @Published var algorithm: SortAlgorithm
    var algorithmType: SortAlgorithms
    var frames: [[Int]]
    var currentIndex: Int
    var range: (low: Int, upper: Int)
    var data: [Int]
    let dataSize: Int
    
    init() {
        range = (low: 0, upper: 100)
        //algorithm = QuickSort()
        algorithm = QuickSort()
        algorithmType = .QuickSort
        data = []
        dataSize = 100
        for _ in 1...dataSize {
            data.append(Int.random(in: range.low..<range.upper))
        }
        frames = []
        currentFrame = data
        currentIndex = 0
    }
    
    func sortFrames() {
        self.frames = algorithm.sort(data: data)
        currentFrame = frames[0]
    }
    
    func setAlgorithm(to alg: SortAlgorithm, of type: SortAlgorithms) {
        self.algorithm = alg
        self.algorithmType = type
    }
    
    func getCurrentFrame() -> [Int]? {
        if (currentIndex >= frames.count) { return nil }
        return frames[currentIndex]
    }
    
    func nextFrame() -> Bool {
        if (currentIndex + 1 < frames.count) {
            currentIndex += 1
            currentFrame = frames[currentIndex]
            return true
        }
        return false
    }
    
    func resetFrame() {
        currentIndex = 0
        currentFrame = frames[currentIndex]
    }
    
}
