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


class ListHistoryViewController: UIViewController, MFMessageComposeViewControllerDelegate {

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

    
    
    @IBOutlet weak var conditionTV: UITextView!
    @IBOutlet weak var addressTV: UITextView!
    
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
