//
//  ArcLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-20.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class ArcLayer: CAShapeLayer {
  
  let animationDuration: CFTimeInterval = 0.18
  
  override init() {
    super.init()
    fillColor = UIColor.blue.cgColor
    path = arcPathStarting.cgPath
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var arcPathPre: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 99.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: 99.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.close()
    return arcPath
  }
  
  var arcPathStarting: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 80.0))
    arcPath.addCurve(to: CGPoint(x: 100.0, y: 80.0), controlPoint1: CGPoint(x: 30.0, y: 70.0), controlPoint2: CGPoint(x: 40.0, y: 90.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.close()
    return arcPath
  }
  
  var arcPathLow: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 60.0))
    arcPath.addCurve(to: CGPoint(x: 100.0, y: 60.0), controlPoint1: CGPoint(x: 30.0, y: 65.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.close()
    return arcPath
  }
  
  var arcPathMid: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 40.0))
    arcPath.addCurve(to: CGPoint(x: 100.0, y: 40.0), controlPoint1: CGPoint(x: 30.0, y: 30.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.close()
    return arcPath
  }
  
  var arcPathHigh: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 20.0))
    arcPath.addCurve(to: CGPoint(x: 100.0, y: 20.0), controlPoint1: CGPoint(x: 30.0, y: 25.0), controlPoint2: CGPoint(x: 40.0, y: 10.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.close()
    return arcPath
  }
  
  var arcPathComplete: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: -5.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: -5.0))
    arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
    arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
    arcPath.close()
    return arcPath
  }
  
  func animate() {
    
    var arcAnimatePre: CABasicAnimation = CABasicAnimation(keyPath: "path")
    
    arcAnimatePre.fromValue = arcPathPre.cgPath
    arcAnimatePre.toValue = arcPathStarting.cgPath
    arcAnimatePre.beginTime = 0.0
    arcAnimatePre.duration = animationDuration
    
    var arcAnimateLow: CABasicAnimation = CABasicAnimation(keyPath: "path")
    
    arcAnimateLow.fromValue = arcPathStarting.cgPath
    arcAnimateLow.toValue = arcPathLow.cgPath
    arcAnimateLow.beginTime = arcAnimatePre.beginTime + arcAnimatePre.duration
    arcAnimateLow.duration = animationDuration
    
    var arcAnimateMid: CABasicAnimation = CABasicAnimation(keyPath: "path")
    
    arcAnimateMid.fromValue = arcPathLow.cgPath
    arcAnimateMid.toValue = arcPathMid.cgPath
    arcAnimateMid.beginTime = arcAnimateLow.beginTime + arcAnimateLow.duration
    arcAnimateMid.duration = animationDuration
    
    var arcAnimateHigh: CABasicAnimation = CABasicAnimation(keyPath: "path")
    
    arcAnimateHigh.fromValue = arcPathMid.cgPath
    arcAnimateHigh.toValue = arcPathHigh.cgPath
    arcAnimateHigh.beginTime = arcAnimateMid.beginTime + arcAnimateMid.duration
    arcAnimateHigh.duration = animationDuration
    
    var arcAnimateComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
    
    arcAnimateComplete.fromValue = arcPathHigh.cgPath
    arcAnimateComplete.toValue = arcPathComplete.cgPath
    arcAnimateComplete.beginTime = arcAnimateHigh.beginTime + arcAnimateHigh.duration
    arcAnimateComplete.duration = animationDuration
    
    var arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
    
    arcAnimationGroup.animations = [arcAnimatePre, arcAnimateLow, arcAnimateMid, arcAnimateHigh, arcAnimateComplete]
    
    arcAnimationGroup.duration = arcAnimateComplete.beginTime + arcAnimateComplete.duration
    arcAnimationGroup.fillMode = kCAFillModeForwards
    arcAnimationGroup.isRemovedOnCompletion = false
    add(arcAnimationGroup, forKey: nil)
    
  }
}
