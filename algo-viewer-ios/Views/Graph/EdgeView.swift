//
//  EdgeView.swift
//  algo-viewer-ios
//
//  Created by Jose Torres-Vargas on 6/19/22.
//

import SwiftUI

struct EdgeView: Shape {
    var startX: CGFloat = 0
    var startY: CGFloat = 0
    var endX: CGFloat = 0
    var endY: CGFloat = 0
    
    init(edge: EdgeProxy) {
        startX = edge.start.x
        startY = edge.start.y
        endX = edge.end.x
        endY = edge.end.y
    }
    
    func path(in rect: CGRect) -> Path {
        var linkPath = Path()
        
        linkPath.move(to: CGPoint(x: startX, y: startY)
            .alignCenterInParent(rect.size))
        linkPath.addLine(to: CGPoint(x: endX, y: endY)
            .alignCenterInParent(rect.size))
        
        return linkPath
    }
    
    
}

struct EdgeView_Previews: PreviewProvider {
    static var previews: some View {
        let edge1 = EdgeProxy(id: UUID(), start: CGPoint(x: -100, y: -100), end: CGPoint(x: 100, y: 100))
        let edge2 = EdgeProxy(
          id: UUID(),
          start: CGPoint(x: 100, y: -100),
          end: CGPoint(x: -100, y: 100))
        return ZStack {
            EdgeView(edge: edge1).stroke(lineWidth: 4)
            EdgeView(edge: edge2).stroke(Color.blue, lineWidth: 2)
          }
        
    }
}


extension CGPoint {
  func translatedBy(x: CGFloat, y: CGFloat) -> CGPoint {
    return CGPoint(x: self.x + x, y: self.y + y)
  }
}

extension CGPoint {
  func alignCenterInParent(_ parent: CGSize) -> CGPoint {
    let x = parent.width/2 + self.x
    let y = parent.height/2 + self.y
    return CGPoint(x: x, y: y)
  }
  
  func scaledFrom(_ factor: CGFloat) -> CGPoint {
    return CGPoint(
      x: self.x * factor,
      y: self.y * factor)
  }
}

extension CGSize {
  func scaledDownTo(_ factor: CGFloat) -> CGSize {
    return CGSize(width: width/factor, height: height/factor)
  }
  
  var length: CGFloat {
    return sqrt(pow(width, 2) + pow(height, 2))
  }
  
  var inverted: CGSize {
    return CGSize(width: -width, height: -height)
  }
}
