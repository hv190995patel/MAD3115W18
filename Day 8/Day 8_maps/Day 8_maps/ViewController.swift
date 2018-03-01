//
//  ViewController.swift
//  Day 8_maps
//
//  Created by MacStudent on 2018-03-01.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import MapKit
//import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    //Location Cordinates
  //let lambtonCollegeLocation = CLLocation(latitude: 37.785834, longitude: -122.406417)
    let regionRadius: CLLocationDistance = 50
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     // centerMapOnLOcation(location: lambtonCollegeLocation, title: "Lambton", subTitle: "College")
        myMap.mapType = MKMapType.standard
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.startUpdatingLocation()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //center map on specified location
    func centerMapOnLOcation(location: CLLocation, title: String, subTitle: String) {
        let coordinareRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        //Focus the map on specific location
        myMap.setRegion(coordinareRegion, animated: true)
        
        //Drop a pin at user's current location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        myAnnotation.title = title
        myAnnotation.subtitle = subTitle
        
        //Display Pin On Location
        myMap.addAnnotation(myAnnotation)
    }
}

extension ViewController:
CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailwithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUPdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            print("location:: \(locations)")
        }
        
        centerMapOnLOcation(location: locationManager.location!, title: "Current Location", subTitle: " ")
    }
    
}

/*
 
 class ViewController: UIViewController {
 
 @IBOutlet weak var myMap: MKMapView!
 //Location Cordinates
 let lambtonCollegeLocation = CLLocation(latitude: 43.773257, longitude: -79.335899)
 let regionRadius: CLLocationDistance = 50
 
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view, typically from a nib.
 
 myMap.mapType = MKMapType.standard
 centerMapOnLOcation(location: lambtonCollegeLocation, title: "Lambton", subTitle: "College")
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }
 
 //center map on specified location
 func centerMapOnLOcation(location: CLLocation, title: String, subTitle: String) {
 let coordinareRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
 
 //Focus the map on specific location
 myMap.setRegion(coordinareRegion, animated: true)
 
 //Drop a pin at user's current location
 let myAnnotation: MKPointAnnotation = MKPointAnnotation()
 myAnnotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
 myAnnotation.title = title
 myAnnotation.subtitle = subTitle
 
 //Display Pin On Location
 myMap.addAnnotation(myAnnotation)
 }
 }
 */
