//
//  ViewController.swift
//  location
//
//  Created by Davide Patrizi on 30/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let status = CLLocationManager.authorizationStatus()
        locManager = CLLocationManager()
        locManager!.requestWhenInUseAuthorization()
        locManager?.desiredAccuracy = kCLLocationAccuracyBest
        locManager?.delegate = self
        locManager?.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        for l in locations as[CLLocation]{
            NSLog("latitude: \(l.coordinate.latitude)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}