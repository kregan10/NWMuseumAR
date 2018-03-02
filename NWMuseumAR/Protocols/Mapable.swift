//
//  Mapable.swift
//  NWMuseumAR
//
//  Created by Kerry Regan on 2018-02-28.
//  Copyright © 2018 NWMuseumAR. All rights reserved.
//

import MapKit

protocol Mapable: class  {
    var startingLocation: CLLocation! { get set }
    var mapView: MKMapView! { get set }
}

extension Mapable {
    
    func centerMapInInitialCoordinates() {
        if startingLocation != nil {
            DispatchQueue.main.async {
                self.mapView.setCenter(self.startingLocation.coordinate, animated: true)
                let latDelta: CLLocationDegrees = 0.004
                let lonDelta: CLLocationDegrees = 0.004
                let span = MKCoordinateSpanMake(latDelta, lonDelta)
                let region = MKCoordinateRegionMake(self.startingLocation.coordinate, span)
                self.mapView.setRegion(region, animated: false)
            }
        }
    }
    
}

