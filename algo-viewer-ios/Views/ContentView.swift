//
//  ContentView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = Tab.sorting
    
    enum Tab {
        case graph
        case sorting
    }
    
    var sorter: Sorter = Sorter()
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selection) {
                Graphs()
                    .tabItem {
                        Label("Graphs", systemImage: "map")
                    }
                    .tag(Tab.graph)
                
                BarPlot(title: sorter.algorithm.rawValue, frame: sorter.frames)
                    .tabItem{
                        Label("Arrays", systemImage: "list.bullet")
                    }
                    .tag(Tab.sorting)
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
        .onAppear {
            sorter.quickSortFrames()
            sorter.frames.printFrames()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
