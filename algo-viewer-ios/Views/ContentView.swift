//
//  ContentView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

func delay(_ delay: Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC)))/Double(NSEC_PER_SEC), execute: closure)
}

struct ContentView: View {
    
    @State private var selection = Tab.sorting
    @EnvironmentObject var md: ModelData
    
    enum Tab {
        case graph
        case sorting
    }
    var body: some View {
        let tap = TapGesture()
            .onEnded { _ in
                print("View Was Tapped!")
                md.sorter.quickSortFrames()
                let numberFrames: Int = md.sorter.frames.frames.count
                for _ in 0...numberFrames {
                        md.updateFrame()
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
