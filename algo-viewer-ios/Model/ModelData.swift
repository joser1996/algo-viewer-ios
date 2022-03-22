//
//  ModelData.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/16/22.
//

import Foundation


final class ModelData: ObservableObject {
    //MARK: Sorting stuff
    var sorter: Sorter
    @Published var currentFrame: [BarDataItem]
    init(){
        //set current frame
        self.sorter = Sorter()
        let rawData = sorter.frames.getCurrentFrame()
        var barData = [BarDataItem]()
        for val in rawData {
            barData.append(BarDataItem(value: val, numValues: sorter.dataSize))
        }
        self.currentFrame = barData
    }

    private func buildBarDataItems(data: [Int]) -> [BarDataItem] {
        var barData = [BarDataItem]()
        for val in data {
            barData.append(BarDataItem(value: val, numValues: sorter.dataSize))
        }
        return barData
    }
    
    func resetFrames() {
        sorter.frames.resetFrames()
        self.currentFrame = buildBarDataItems(data: sorter.frames.getCurrentFrame())
    }
    
    func updateFrame() -> Bool{
        let frames: Frame = sorter.frames
        if (frames.advanceFrame()) {
            let rawData = frames.getCurrentFrame()
            self.currentFrame = buildBarDataItems(data: rawData)
            print("Updated Frame!")
            return true
        } else {
            print("Couldn't update Frame")
            return false
        }
    }
}
