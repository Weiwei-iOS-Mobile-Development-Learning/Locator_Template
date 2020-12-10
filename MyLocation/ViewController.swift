//
//  ViewController.swift
//  MyLocation
//
//  Created by NDHU_CSIE on 2020/12/10.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import CoreLocation     //import for GPS

class ViewController: UIViewController,CLLocationManagerDelegate {  // CLLocationManagerDelegate
    
    //Set a locationManager
    let locationManager = CLLocationManager()
    
    //Include IBOutlets
    @IBOutlet var latLabel: UILabel!
    @IBOutlet var longLabel: UILabel!

    @IBAction func getLocation(){
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        // When accuracy is within ten meters, will get currrent position information
        
        // MARK: - Method1: Request once
        locationManager.requestLocation()
        
        // MARK: - Method2: Continuous request
        //locationManager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Retrieve authorizationStatus
        let authState = CLLocationManager.authorizationStatus()
        if authState == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            latLabel.text = "\(location.coordinate.latitude)"
            longLabel.text = "\(location.coordinate.longitude)"
            
        }
    }

}

