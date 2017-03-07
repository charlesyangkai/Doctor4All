//
//  TriangleLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-19.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {
  
  let innerPadding: CGFloat = 30.0
  
  override init!() {
    super.init()
    fillColor = Colors.red.cgColor
    strokeColor = Colors.red.cgColor
    lineWidth = 7.0
    lineCap = kCALineCapRound
    lineJoin = kCALineJoinRound
    path = trianglePathSmall.cgPath
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var trianglePathSmall: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.move(to: CGPoint(x: 5.0 + innerPadding, y: 95.0))
    trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLine(to: CGPoint(x: 95.0 - innerPadding, y: 95.0))
    trianglePath.close()
    return trianglePath
  }
  
  var trianglePathLeftExtension: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLine(to: CGPoint(x: 95.0 - innerPadding, y: 95.0))
    trianglePath.close()
    return trianglePath
  }
  
  var trianglePathRightExtension: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLine(to: CGPoint(x: 95.0, y: 95.0))
    trianglePath.close()
    return trianglePath
  }
  
  var trianglePathTopExtension: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5))
    trianglePath.addLine(to: CGPoint(x: 95.0, y: 95.0))
    trianglePath.close()
    return trianglePath
  }
  
  func animate() {
    
  }
}
