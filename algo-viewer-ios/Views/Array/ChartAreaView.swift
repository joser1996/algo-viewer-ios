//
//  ChartAreaView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 3/9/22.
//

import SwiftUI

struct ChartAreaView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .fill(Color(#colorLiteral(red: 0.8906477705, green: 0.9005050659, blue: 0.8208766097, alpha: 1)))
            
        }
    }
}

struct ChartAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ChartAreaView()
    }
}
