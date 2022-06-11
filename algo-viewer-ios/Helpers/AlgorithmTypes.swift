//
//  AlgorithmTypes.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import Foundation

enum GraphAlgorithms {
    case BFS
    case DFS
}


//Add new sort algorithm here
//define behavior in its own class of superType SortAlgorithm
enum SortAlgorithms: String, CaseIterable, Identifiable {
    var id: Self { self }
    case QuickSort = "Quick Sort"
    case MergeSort = "Merge Sort"
//    case HeapSort = "Heap Sort"
}
