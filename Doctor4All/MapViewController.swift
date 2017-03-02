//
//  MapViewController.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/1/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var currentLocation = MKPointAnnotation()
    var selectedClinics = MKPointAnnotation()
    var resultSearchController: UISearchController? = nil
    var indexPathRow: Int!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Create MakeAnAppointment Button Programatically
        createButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createButton() {
        
        let button = UIButton()
        // Remove the constraint for subview
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Make An Appointment", for: .normal)
        button.setTitleColor(UIColor.magenta , for: .normal)
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        view.addSubview(button)
        
        let leftSide = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0)
        let rightSide = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0)
        let bottomSide = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80)
        
        view.addConstraints([leftSide, rightSide, bottomSide, heightConstraint])
    }
    
    func buttonPressed(){
        print("You're cute.")
    }
    
  /*
    func whenStationIsSelected(){
     
     loop here for all selected clinics
        
        let latitude = BikeStation.allBikeStations[indexPathRow].latitude
        let longitude = BikeStation.allBikeStations[indexPathRow].longitude
        print(latitude, longitude)
        
        // Setting selected station's coordinates
        selectedStation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        selectedStation.title = BikeStation.allBikeStations[indexPathRow].stationName
        selectedStation.subtitle = String(BikeStation.allBikeStations[indexPathRow].availableBikes)
        mapView.addAnnotation(selectedStation)
        mapView.delegate = self
        
        let pin = MKPinAnnotationView()
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
    }
*/


}

extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Sian la got this stoopid twat error: \(error)")
    }
    
    // User's Current Location
    // Info will be updated so we can get the latest info
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        // Span to current location
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
            locationManager.stopUpdatingLocation()
        }
    }
}

