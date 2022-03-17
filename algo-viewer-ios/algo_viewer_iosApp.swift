//
//  algo_viewer_iosApp.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

@main
struct algo_viewer_iosApp: App {
    @StateObject private var md = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(md)
        }
    }
}
