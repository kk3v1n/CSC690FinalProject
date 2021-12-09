//
//  findNearbyViewController.swift
//  FinalAppProject
//
//  Created by Kevin Karmacharya on 12/9/21.
//


import UIKit
import MapKit
import CoreLocation // get user's location

class findNearbyViewController: UIViewController {
    
    @IBOutlet weak var totalMapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    //coordinates of convention center
    //37.3292° N, -121.8890° W
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization() //ask user for thier location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // get the best location
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        totalMapView.showsUserLocation = true
        
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 37.3292, longitude: -121.8890)
        totalMapView.addAnnotation(pin)
    }
}
