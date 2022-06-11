//
//  ContentView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = Tab.sorting
    @EnvironmentObject var md: Sorter
    @State private var running: Bool = false
    @State private var isShowingOptions = false
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
                md.sortFrames()
                let dataSize = md.dataSize
                let animationDuration = (dataSize/10)*500
                let steps: Int = md.frames.count
                let stepDuration = (animationDuration/steps)
                (0..<steps).forEach { step in
                    let updateInterval = DispatchTimeInterval.milliseconds(step*stepDuration)
                    let deadline = DispatchTime.now() + updateInterval
                    DispatchQueue.main.asyncAfter(deadline: deadline) {
                        md.nextFrame()
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
                
                BarPlot(title: md.algorithm.name)
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
                        print("Butt Presssed")
                        self.isShowingOptions = true
                    } label: {
                        Label("Options", systemImage: "gear")
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button {
                        print("Reset")
                        md.resetFrame()
                    } label: {
                        Label("Reset", systemImage: "arrow.clockwise")
                    }
                }
            }
            .background(
                NavigationLink(destination: SettingsPage(selection: md.algorithmType), isActive: $isShowingOptions) {
                    EmptyView()
                }.hidden() //not visible to user
            )
            .accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Sorter())
            .previewInterfaceOrientation(.portrait)
    }
}
