//
//  algo_viewer_iosApp.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

//vaule types: each instance has a copy: struct, enums
//reference: one copy and multiple refrences: class

@main
struct algo_viewer_iosApp: App {
    //@StateObject private var md = ModelData()
    @StateObject private var md = Sorter()
    //StateObject allows me to create reference type to be used in other
    //views
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(md)
        }
    }
}
