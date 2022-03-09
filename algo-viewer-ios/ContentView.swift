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
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Graph View")
                .tabItem {
                    Label("Graphs", systemImage: "star")
                }
                .tag(Tab.graph)
            
            Text("Sorting View")
                .tabItem{
                    Label("Arrays", systemImage: "star")
                }
                .tag(Tab.sorting)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
