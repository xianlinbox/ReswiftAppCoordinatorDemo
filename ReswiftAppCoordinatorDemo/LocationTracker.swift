//
//  LocationTracker.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 06/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import CoreLocation

class LocationTracker:NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var callback: ((String) -> Void)?
    func getCurrentLocation(_ callback: ((String) -> Void)?){
        self.callback = callback
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.callback?("\(locValue.latitude),\(locValue.longitude)")
        locationManager.stopUpdatingLocation();
    }
}
