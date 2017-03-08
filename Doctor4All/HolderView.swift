//
//  HolderView.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-17.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
  func animateLabel()
}

class HolderView: UIView {
    
    let arcLayer = ArcLayer()
    
    let ovalLayer = OvalLayer()
    
    let triangleLayer = TriangleLayer()
    
    let redRectangleLayer = RectangleLayer()
    
    let blueRectangleLayer = RectangleLayer()

  var parentFrame :CGRect = CGRect.zero
  weak var delegate:HolderViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.clear
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
    
    func addOval() {
        
        layer.addSublayer(ovalLayer)
        
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: "wobbleOval", userInfo: nil, repeats: false)
    }
    
    func wobbleOval() {
        
        layer.addSublayer(triangleLayer)
        ovalLayer.wobble()
        
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: "drawAnimatedTriangle", userInfo: nil, repeats: false)
        
        ovalLayer.wobble()
    }
    
    func drawAnimatedTriangle() {
        
        
        
        triangleLayer.animate()
        
        
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: "spinAndTransform", userInfo: nil, repeats: false)
        
        
    }
    
    func spinAndTransform() {
        
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.6)
        
        var rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")

        rotationAnimation.toValue = CGFloat(M_PI * 2.0)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        layer.add(rotationAnimation, forKey: nil)
        
        ovalLayer.contract()
        
        Timer.scheduledTimer(timeInterval: 0.45, target: self, selector: "drawRedAnimatedRectangle", userInfo: nil, repeats: false)
        
        Timer.scheduledTimer(timeInterval: 0.65, target: self, selector: "drawBlueAnimatedRectangle", userInfo: nil, repeats: false)
        
    }
    
    func drawRedAnimatedRectangle() {
        
        layer.addSublayer(redRectangleLayer)
        
        redRectangleLayer.animateStrokeWithColor(UIColor.red)
        
    }
    
    func drawBlueAnimatedRectangle() {
        
        layer.addSublayer(blueRectangleLayer)
        
        blueRectangleLayer.animateStrokeWithColor(UIColor.blue)
        
        Timer.scheduledTimer(timeInterval: 0.40, target: self, selector: "drawArc", userInfo: nil, repeats: false)
        
        
        
        
    }
    
    func drawArc() {
        layer.addSublayer(arcLayer)
        arcLayer.animate()
        
        Timer.scheduledTimer(timeInterval: 0.90, target: self, selector: "expandView", userInfo: nil, repeats: false)
        
        
        
    }
    
    func expandView() {
        backgroundColor = UIColor.blue
        
        frame = CGRect(x: frame.origin.x - blueRectangleLayer.lineWidth, y: frame.origin.y - blueRectangleLayer.lineWidth, width: frame.size.width + blueRectangleLayer.lineWidth * 2, height: frame.size.height + blueRectangleLayer.lineWidth * 2)
        
        layer.sublayers = nil
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: { 
            self.frame = self.parentFrame
        }) { (finished) in
            self.addLabel()
        }
    }
    
    func addLabel() {
        
        delegate?.animateLabel()
    
    }

    
}













