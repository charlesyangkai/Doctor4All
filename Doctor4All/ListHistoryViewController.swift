//
//  ListHistoryViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 12/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import MessageUI
import MapKit


class ListHistoryViewController: UIViewController, MFMessageComposeViewControllerDelegate, UITextViewDelegate {
    
@IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    //Variables
    let geoCoder = CLGeocoder()
    var theCoordinates: CLLocationCoordinate2D?
    
    //Function
    func openMapForPlace() {
        
        geoCoder.geocodeAddressString("KLCC") { (placemarks, error) in
            if error == nil,
                let placemarks = placemarks {
                if placemarks.count != 0 {
                    for placemark in placemarks {
                        //if let placemark = placemarks.first {
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = (placemark.location?.coordinate)!
                        let theCoordinates = annotation.coordinate
                        print(theCoordinates)
                        
                        
                    }
                }
            }
        }
        
        guard let coordinates = theCoordinates else {return}
        
        let regionDistance:CLLocationDistance = 10000
        //let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Place Name"
        mapItem.openInMaps(launchOptions: options)
    }

    
    
    @IBOutlet weak var conditionTV: UITextView! {
        didSet {
            conditionTV.delegate = self
            
        }
        
    }
    @IBOutlet weak var addressTV: UITextView! {
        didSet {
            addressTV.delegate = self
            
        }
        
    }
    public var activeTextView: UITextView?
    
    @IBAction func showLocationBtn(_ sender: Any) {
        
        
        openMapForPlace()
        
    }
    
    @IBAction func contactDoctorBtn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Contact Doctor", message: "please chose your communication", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "SMS Message", style: UIAlertActionStyle.default){ UIAlertAction in
            self.sendMessage()
            
        })
        
        
    
        alertController.addAction(UIAlertAction(title: "Call Mobile", style: UIAlertActionStyle.destructive){ UIAlertAction in
            self.makeCall()
        })
        
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
                    

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Requests History"
        
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            guard
                let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
                let activeFrame = activeTextView?.frame else {
                    animatePushKeyboard(userInfo, toHeight: 10.0)
                    return
            }
            
            
            if activeFrame.maxY < endFrame.minY {
                animatePushKeyboard(userInfo, toHeight: 10.0)
                return
            }
            
            
            if endFrame.origin.y >= UIScreen.main.bounds.size.height {
                animatePushKeyboard(userInfo, toHeight: 10.0)
            } else {
                animatePushKeyboard(userInfo, toHeight: endFrame.size.height)
            }
            
        }
        
    }
    
    func animatePushKeyboard(_ userInfo:[AnyHashable:Any], toHeight: CGFloat){
        
        self.keyboardHeightLayoutConstraint?.constant = toHeight
        let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
        UIView.animate(withDuration: duration,
                       delay: TimeInterval(0),
                       options: animationCurve,
                       animations: { self.view.layoutIfNeeded() },
                       completion: nil)
    }

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //~~~~~~~~ MESSAGE~~~~~~~~~~
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendMessage(){
        if MFMessageComposeViewController.canSendText(){
            let controller = MFMessageComposeViewController()
            controller.body = "Hello"
            controller.recipients = ["0143056441"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }else{
            print("Can't Load Message App")
        }
    }
    
    //~~~~~~~~ CALL~~~~~~~~~~~~~
    
    func makeCall(){
        
        let url: NSURL = URL(string: "TEL://0143056441")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
    }
    

}
