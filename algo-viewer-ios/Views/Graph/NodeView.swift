//
//  NodeView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/19/22.
//

import SwiftUI

struct NodeView: View {
    static let width = CGFloat(100)
    @State var node: Node
    
    var body: some View {
        Ellipse()
            .fill(Color.green)
            .overlay(Text(node.text)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)))
            .frame(width: NodeView.width, height: NodeView.width, alignment: .center)
    }
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        let node1 = Node(text: "Hello")
        let node2 = Node(text: "What")
        
        return VStack {
            NodeView(node: node1)
            NodeView(node: node2)
        }
    }
}
