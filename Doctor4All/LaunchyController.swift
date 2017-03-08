//
//  ViewController.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-16.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class LaunchyController: UIViewController, HolderViewDelegate {
    
    
    var color = UIColor(netHex: 0x474CFC)
    
    var holderView = HolderView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        addHolderView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        
        holderView.addOval()
    }
    
    func animateLabel() {
        
        holderView.removeFromSuperview()
        view.backgroundColor = color
        var label: UILabel = UILabel(frame: view.frame)
        label.textColor = UIColor.white
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 41.0)
        label.textAlignment = NSTextAlignment.center
        label.text = "Doctor Kush"
        label.transform = label.transform.scaledBy(x: 0.25, y: 0.25)
        //    label.transform = CATransform3DMakeScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            label.transform = label.transform.scaledBy(x: 4.0, y: 4.0)
        }) { (finished) in
            
            self.toMainViewController()
            //self.addButton()
            
        }
        
    }
    
    func toMainViewController(){
        let when = DispatchTime.now() + 1.5
        
        DispatchQueue.main.asyncAfter(deadline: when) { 
            self.performSegue(withIdentifier: "launchySegue", sender: nil)
        }
    }
    
    func addButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: view.bounds.height)
        button.addTarget(self, action: #selector(LaunchyController.buttonPressed(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func buttonPressed(_ sender: UIButton!) {
        view.backgroundColor = UIColor.white
        view.subviews.map({ $0.removeFromSuperview() })
        
        
        holderView = HolderView(frame: CGRect.zero)
        addHolderView()
    }
    
    
    
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
    
    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
    
}
