//
//  ViewController.swift
//  Doctor4All
//
//  Created by Charles Lee on 1/3/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class AuthController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var signUp: UIButton! {
        
        
    }
    
    var colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
    
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var webViewBG: UIWebView!
    
    
    
    
    @IBAction func logIn(_ sender: Any) {
        
        
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        
        
    }
    
    
    
    /*-----------------------------------------------------------------------------*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let htmlPath = Bundle.main.path(forResource: "WebViewContent", ofType: "html")
        let htmlURL = URL(fileURLWithPath: htmlPath!)
        let html = try? Data(contentsOf: htmlURL)
        
        self.webViewBG.load(html!, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: htmlURL.deletingLastPathComponent())
        
//        configurePageControl()
        
//        scrollView.delegate = self
//        self.view.addSubview(scrollView)
//        for index in 1..<4 {
//            
//            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
//            frame.size = self.scrollView.frame.size
//            self.scrollView.isPagingEnabled = true
//            
//            var subView = UIView(frame: frame)
//            subView.backgroundColor = colors[index]
//            self.scrollView.addSubview(subView)
        
            
//        }
        
//        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 4, height: self.frame.size.height)
//        pageControl.addTarget(self, action: "changePage", for: UIControlEvents.valueChanged)
    
        
    }
    
//    func configurePageControl() {
//        
//        //The total number of pages that are available is based on how many available colors we have
//        self.pageControl.numberOfPages = colors.count
//        self.pageControl.currentPage = 0
//        self.pageControl.tintColor = UIColor.red
//        self.pageControl.currentPageIndicatorTintColor = UIColor.green
//        self.pageControl.pageIndicatorTintColor = UIColor.black
//        self.view.addSubview(pageControl)
//    }
    
    //MARK: To change while clicking on page control
//    func changePage() -> () {
//        
//        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
//        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
//        
//
//    }

//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
//        pageControl.currentPage = Int(pageNumber)
//        
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }


}

