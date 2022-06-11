//
//  SettingsPage.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/22/22.
//

import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var sorter: Sorter
    @State private var selection: SortAlgorithms
    
    init (selection: SortAlgorithms) {
        self.selection = selection
    }
    
    var body: some View {
        Form {
            Section(header: Text("Sort Algorithms")) {
                Picker("Choose Algorithm", selection: $selection) {
                    ForEach(SortAlgorithms.allCases, id: \.id) { value in
                        Text(value.rawValue).tag(value)
                    }
                }
                .onChange(of: selection) { newValue in
                    sorter.setAlgorithm(to: SortAlgorithmFactory.buildAlgorithm(of: newValue), of: newValue)
                }
            }
        }
        .padding()
    }
}

