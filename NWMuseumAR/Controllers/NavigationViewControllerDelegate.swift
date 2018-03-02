//
//  NavigationViewControllerDelegate.swift
//  NWMuseumAR
//
//  Created by Kerry Regan on 2018-02-28.
//  Copyright © 2018 NWMuseumAR. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

protocol NavigationViewControllerDelegate: class {
    func reset()
    func startNavigation(with route: [POIAnnotation], for destination: CLLocation, and legs: [[CLLocationCoordinate2D]], and step: [MKRouteStep])
}

