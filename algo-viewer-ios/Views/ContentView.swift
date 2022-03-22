//
//  ContentView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = Tab.sorting
    @EnvironmentObject var md: ModelData
    @State private var running: Bool = false
    
    enum Tab {
        case graph
        case sorting
    }
    
    var body: some View {
        let tap = TapGesture()
            .onEnded { _ in
                if (running) {return}
                running = true
                print("View Was Tapped!")
                md.sorter.sortFrames()
                let dataSize = md.sorter.dataSize
                let animationDuration = (dataSize/10)*500
                let steps: Int = md.sorter.frames.frames.count
                let stepDuration = (animationDuration/steps)
                (0..<steps).forEach { step in
                    let updateInterval = DispatchTimeInterval.milliseconds(step*stepDuration)
                    let deadline = DispatchTime.now() + updateInterval
                    DispatchQueue.main.asyncAfter(deadline: deadline) {
                        md.updateFrame()
                        if step == steps - 1 {
                            running = false
                        }
                    }

                }

            }
        
        NavigationView {
            TabView(selection: $selection) {
                Graphs()
                    .tabItem {
                        Label("Graphs", systemImage: "map")
                    }
                    .tag(Tab.graph)
                
                BarPlot(title: md.sorter.algorithm.rawValue)
                    .tabItem{
                        Label("Arrays", systemImage: "list.bullet")
                    }
                    .tag(Tab.sorting)
                    .gesture(tap)
            }
            .onAppear {
                UITabBar.appearance().barTintColor = .gray
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        print("Bring up settings page")
                    } label: {
                        Label("options", systemImage: "gearshape")
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button {
                        print("Reset")
                        md.resetFrames()
                    } label: {
                        Label("Reset", systemImage: "arrow.clockwise")
                    }
                }
            }
            .accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .previewInterfaceOrientation(.portrait)
    }
}
