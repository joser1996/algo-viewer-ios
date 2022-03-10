//
//  Frame.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import Foundation

class Frame {
    var frames: [[Int]]
    var sortedCopy: [Int]
    let originalData: [Int]
    var currentFrameIndex: Int
    
    init(_ data: [Int]) {
        frames = [[Int]]()
        sortedCopy = data
        originalData = data
        frames.append(originalData)
        currentFrameIndex = 0
    }
    
    func printFrames() {
        for (index, frame) in frames.enumerated() {
            print("Frame:\(index):\t\(frame)")
        }
    }
    
    func insertFrame(frame: [Int]) {
        self.frames.append(frame)
    }
    
    func resetFrames() {
        currentFrameIndex = 0
    }
    
    func getCurrentFrame() -> [Int] {
        return frames[currentFrameIndex]
    }
    
    func advanceFrame() -> Bool {
        if (currentFrameIndex <  self.frames.count){
            currentFrameIndex += 1
            return true
        }
        return false
    }
    
}
