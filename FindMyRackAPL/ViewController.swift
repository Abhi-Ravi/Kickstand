//
//  ViewController.swift
//  FindMyRackAPL
//
//  Created by Abhi Ravi on 3/2/19.
//  Copyright © 2019 Abhi Ravi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        createAnnotations(locations: annotationLocations)
        findClosestRack(locations: annotationLocations)
    }
    
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
        
//        print(locationManager.location?.coordinate)
//        print(locationManager.location?.coordinate.longitude as Any)
        
        
    }
    
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
           print("oops")
        }
    }
    
    //marker data
    let annotationLocations = [
//        [" title": "Will Skelton Greenway", "rackType":"hoop", "address": "2225 Estelle Circle", "latitude":35.961614, "longitude": -83.882901],
//
//        ["title": "Ned McWheter Park", "rackType":"hoop", "address": "1648 Riverside", "latitude":35.963440, "longitude": -83.896666],
//
//        ["title": "Burlington Branch Library", "rackType":"hoop", "address": "4614 Asheville Hwy", "latitude":36.004390, "longitude": -83.859357],
//
//        ["title": "Cansler YMCA", "rackType":"hoop", "address": "616 Jessamine", "latitude":35.978893, "longitude": -83.912293],
//
//        ["title": "Farragut High School", "rackType":"hoop", "address": "11237 Kingston Pike, Knoxville, TN 37934", "latitude": 35.887757, "longitude": -84.159864],
//
//       ["title": "Farragut Presbyterian Church", "rackType":"hoop", "address": "209 Jamestowne Blvd, Knoxville, TN 37934", "latitude": 35.882292, "longitude": -84.166076],
//
//       ["title": "Farragut Town Hall", "rackType":"hoop", "address": "11408 Municipal Center Dr, Farragut, TN 37934", "latitude": 35.878445, "longitude": -84.160917],
//
//      ["title": "Campbell Station Park", "rackType":"hoop", "address": "405 N Campbell Station Rd, Farragut, TN 37934", "latitude": 35.888581, "longitude": -84.16714],
//
//      ["title": "Farragut Parks", "rackType":"hoop", "address": "301 Watt Rd, Farragut, TN 37934", "latitude": 35.865147, "longitude": -84.225743],
        ["title": "Will Skelton Greenway", "rackType":"Hoop", "address": "2225 Estelle Circle", "latitude": 35.9616, "longitude": -83.8827],
        
        ["title": "Ned McWheter Park", "rackType":"Hoop", "address": "1648 Riverside", "latitude": 35.9635, "longitude": -83.4897],
        
        ["title": "Burlington Branch Library", "rackType":"Hoop", "address": "4614 Asheville Hwy, Knoxville, TN 37914", "latitude": 36.0044, "longitude": -83.8595],
        
        ["title": "Cansler YMCA", "rackType":"Hitch", "address": "616 Jessamine", "latitude": 35.9789, "longitude": -83.9123],
        
        ["title": "Farragut High School", "rackType":"Hoop", "address": " 11237 Kingston Pike, Knoxville, TN 37934", "latitude": 35.8878, "longitude": -84.1599],
        
        ["title": "Farragut Presbyterian Church", "rackType":"Hoop", "address": "209 Jamestowne Blvd, Knoxville, TN 37934", "latitude": 35.8823, "longitude": -84.1661],
        
        ["title": "Farragut Town Hall", "rackType":"Hitch", "address": "11408 Municipal Center Dr, Farragut, TN 37934", "latitude": 35.8784, "longitude": -84.1609],
        
        ["title": "Campbell Station Park across from Herron Rd", "rackType":"Hoop", "address": " 405 N Campbell Station Rd, Farragut, TN 37934", "latitude": 35.8886, "longitude": -84.1671],
        
        ["title": "Farragut Parks", "rackType":"Hoop", "address": "301 Watt Rd, Farragut, TN 37934", "latitude": 35.8651, "longitude": -84.2257],
        
        ["title": "Turkey Creek Medical Center", "rackType":"Hoop", "address": "10810 Parkside Dr", "latitude": 35.8987, "longitude": -84.1444],
        
        ["title": "Olive Garden", "rackType":"Hoop", "address": "10923 Parkside Dr, Knoxville, TN 37934", "latitude": 35.9037, "longitude": -84.148],
        
        ["title": "Travelers Call Center", "rackType":"Hoop", "address": "1101 Corridor Park Blvd, Knoxville, TN 37932", "latitude": 35.9201, "longitude": -84.1439],
        
        ["title": "Parkwest Hospital", "rackType":"Hoop", "address": "9352 Park W Blvd, Knoxville, TN 37923", "latitude": 35.9178, "longitude": -84.0998],
        
        ["title": "Starbucks - Kingston Pike - Bearden Kroger", "rackType":"Hoop", "address": "none", "latitude": 35.9407, "longitude": -83.9854],
        
        ["title": "TV Unitarian Church", "rackType":"Hoop", "address": "2931 Kingston Pike", "latitude": 35.9523, "longitude": -83.9524],
        
        ["title": "Caswell Park", "rackType":"Hoop", "address": "570 Winona St", "latitude": 35.9809, "longitude": -83.9096],
        
        ["title": "Panera", "rackType":"Hoop", "address": "4893 N Broadway", "latitude": 36.0282, "longitude": -83.9288],
        
        ["title": "Knox County Health Dept - North Entrance ", "rackType":"Hoop", "address": "140 Dameron Ave", "latitude": 35.978, "longitude": -83.9277],
        
        ["title": "Western Plaza", "rackType":"Hitch", "address": "none", "latitude": 35.942, "longitude": -83.9791],
        
        ["title": "Forest Park Blvd/Third Creek Trailhead", "rackType":"Hoop", "address": "none", "latitude": 35.9427, "longitude": -83.9815],
        
        ["title": "Tyson Park", "rackType":"Hoop", "address": "2351 Kingston Pike", "latitude": 35.9546, "longitude": -83.9448],
        
        ["title": "Sterchi Lofts", "rackType":"Hitch", "address": "116 S. Gay street", "latitude": 35.9687, "longitude": -83.9198],
        
        ["title": "Emporium", "rackType":"Hitch", "address": "100 S. Gay street", "latitude": 35.9691, "longitude": -83.9203],
        
        ["title": "Visitors Center/WDVX", "rackType":"Hitch", "address": "301 S. Gay street", "latitude": 35.9672, "longitude": -83.9195],
        
        ["title": "Downtown Wine & Spirits", "rackType":"Hitch", "address": "407 S. Gay St.", "latitude": 35.9662, "longitude": -83.919],
        
        ["title": "Harrogate's", "rackType":"Hitch", "address": "411 S. Gay Street", "latitude": 35.9661, "longitude": -83.9189],
        
        ["title": "Regions - Miller Building", "rackType":"Hitch", "address": "465 S. Gay street", "latitude": 35.9654, "longitude": -83.9186],
        
        ["title": " Krutch Park - east end", "rackType":"Hitch", "address": "521 S. Gay St.", "latitude": 35.9649, "longitude": -83.918],
        
        ["title": "East Tennessee History Center", "rackType":"Hitch", "address": "601 Gay Street", "latitude": 35.9639, "longitude": -83.9182],
        
        ["title": "One Centre Sq", "rackType":"Hitch", "address": "620 Market street", "latitude": 35.9637, "longitude": -83.918],
        
        ["title": "Former Regions / AmSouth Building ", "rackType":"Hitch", "address": "505 S Gay St", "latitude": 35.9651, "longitude": -83.9182],
        
        ["title": "S Krutch Park", "rackType":"Hitch", "address": "315 Clinch", "latitude": 35.9643, "longitude": -83.9183],
        
        ["title": "Urban Outfitters", "rackType":"Hitch", "address": "503 Market St", "latitude": 35.9647, "longitude": -83.9194],
        
        ["title": "Market Square", "rackType":"Hitch", "address": "Market Square", "latitude": 35.9651, "longitude": -83.9191],
        
        ["title": "YMCA", "rackType":"Hitch", "address": "605 Clinch", "latitude": 35.9632, "longitude": -83.9211],
        
        ["title": "YWCA", "rackType":"Hitch", "address": "492 Clinch", "latitude": 35.9636, "longitude": -83.9195],
        
      
    ]
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }
    
    //adding markers to map
    func createAnnotations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            
            mapView.addAnnotation(annotations)
        }
    }
    
    func findClosestRack(locations: [[String : Any]] ) {
        _ = locationManager.location?.coordinate
        
                print(locationManager.location?.coordinate.longitude as Any)
                print(locationManager.location?.coordinate.latitude as Any)
        var i = 0;
        
        let currentLatitude = locationManager.location?.coordinate.latitude
        let currentLongitude = locationManager.location?.coordinate.longitude
        
        var minimumDistance = 99999.9;
        var minIndex = 0;
        
         if currentLatitude != nil && currentLongitude != nil {
        for object in annotationLocations{
            
            if let actualLongitude = object["longitude"] as? Double, let actualLatitude = object["latitude"] as? Double {
                //print(i, ": longitude = ", actualLongitude, "   latitude = ", actualLatitude)
                
                    var distanceLatitude = actualLatitude - currentLatitude!
                
                
                if distanceLatitude < 0{
                    distanceLatitude *= -1
                }
                
                distanceLatitude = round(distanceLatitude * 1000000)/1000000 // <-- formatting nmber to millionth place
                
                var distanceLongitude = actualLongitude - currentLongitude!
                distanceLongitude = round(distanceLongitude * 1000000)/1000000
                if distanceLongitude < 0 {
                    distanceLongitude *= -1
                }
                
                let distance = distanceLatitude + distanceLongitude
                if (distance < minimumDistance){
                    minimumDistance = distance
                    minIndex = i
                }
                
                //print("Distance from current location: ", distance, "\n")
                
            }
            i += 1
        }
        
        print("The minimum Distance = ", minimumDistance, " and is on index ", minIndex)
        if let actualNode = annotationLocations[minIndex]["title"] {
            print(actualNode)
        }
        
        // 1.
        mapView.delegate = self
        
            guard let  sourceLong =  currentLongitude else { return print("oops") }
            guard let sourceLat = currentLatitude else { return print("oops") }
            
        // 2.
        let sourceLocation = CLLocationCoordinate2D(latitude: sourceLat, longitude: sourceLong)
        
        let destinationLocation = CLLocationCoordinate2D(latitude: annotationLocations[minIndex]["latitude"] as! CLLocationDegrees, longitude: annotationLocations[minIndex]["longitude"] as! CLLocationDegrees)
        
        // 3.
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 4.
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        // 5.
        let sourceAnnotation = MKPointAnnotation()
        
        
//        sourceAnnotation.title = "currentLocation"
//
//        if let location = sourcePlacemark.location {
//            sourceAnnotation.coordinate = location.coordinate
//        }
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = annotationLocations[minIndex]["title"] as? String
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        // 6.
        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
        // 7.
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .walking
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        // 8.
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    
        /********************** ROUTING CODE (WIP) *************************/
    }
        
}


//
//    func findPath(locations: [[String : Any]]){
//        // 1.
//        mapView.delegate = self as? MKMapViewDelegate
//
//        // 2.
//        let sourceLocation = CLLocationCoordinate2D(latitude: 35.963440, longitude: -83.882901)
//        let destinationLocation = CLLocationCoordinate2D(latitude: 36.004390, longitude: -83.859357)
//
//        // 3.
//        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
//        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
//
//        // 4.
//        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
//        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
//        // 5.
//        let sourceAnnotation = MKPointAnnotation()
//
//
//        sourceAnnotation.title = "Times Square"
//
//        if let location = sourcePlacemark.location {
//            sourceAnnotation.coordinate = location.coordinate
//        }
//        let destinationAnnotation = MKPointAnnotation()
//        destinationAnnotation.title = "Empire State Building"
//
//        if let location = destinationPlacemark.location {
//            destinationAnnotation.coordinate = location.coordinate
//        }
//
//        // 6.
//        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
//
//        // 7.
//        let directionRequest = MKDirections.Request()
//        directionRequest.source = sourceMapItem
//        directionRequest.destination = destinationMapItem
//        directionRequest.transportType = .automobile
//
//        // Calculate the direction
//        let directions = MKDirections(request: directionRequest)
//
//        // 8.
//        directions.calculate {
//            (response, error) -> Void in
//
//            guard let response = response else {
//                if let error = error {
//                    print("Error: \(error)")
//                }
//
//                return
//            }
//
//            let route = response.routes[0]
//            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
//
//            let rect = route.polyline.boundingMapRect
//            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
//        }
//    }
//
//}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }


    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

