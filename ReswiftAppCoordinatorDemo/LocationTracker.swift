//
//  LocationTracker.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 06/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import CoreLocation

class LocationTracker :NSObject, CLLocationManagerDelegate {
    var locationManager:CLLocationManager?
    var onSuccess: ((String) -> Void)?
    var onFailure: ((String) -> Void)?

    func getCurrentLocation(success: ((String) -> Void)?, fail: ((String) -> Void)?){
        self.locationManager = CLLocationManager()
        self.onSuccess = success
        self.onFailure = fail
        
        // Ask for Authorisation from the User.
        self.locationManager?.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager?.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager?.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.onSuccess?("\(locValue.latitude),\(locValue.longitude)")
        self.locationManager?.stopUpdatingLocation()
        self.locationManager = nil
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.onFailure?(error.localizedDescription)
        self.locationManager?.stopUpdatingLocation()
        self.locationManager = nil
    }

}
