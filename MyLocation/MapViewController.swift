//
//  MapViewController.swift
//  MyLocation
//
//  Created by NDHU_CSIE on 2020/12/10.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.showsUserLocation = true
        
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
}
