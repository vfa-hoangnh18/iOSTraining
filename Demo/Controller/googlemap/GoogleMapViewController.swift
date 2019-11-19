/*
 * Copyright 2016 Google Inc. All rights reserved.
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
 * file except in compliance with the License. You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapViewController: UIViewController {
    let lat = 37.785834
    let lng = -122.406417
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The currently selected place.
    var selectedPlace: GMSPlace?
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
    
    // Update the map once the user has made their selection.
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        // Clear the map.
        mapView.clear()
        
        // Add a marker to the map.
        if selectedPlace != nil {
            let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
            marker.title = selectedPlace?.name
            marker.snippet = selectedPlace?.formattedAddress
            marker.map = mapView
        }
        
        listLikelyPlaces()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the location manager.
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        
        // Create a map.
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                              longitude: defaultLocation.coordinate.longitude,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        // Add the map to the view, hide it until we've got a location update.
        view.addSubview(mapView)
        mapView.isHidden = true
        
        listLikelyPlaces()
        drawPolyline()
        drawPolyGon()
        drawCircle()
        //drawHollowPolygon()
    }
    func drawHollowPolygon(){
        /*let hydeParkLocation = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        //let camera = GMSCameraPosition.camera(withTarget: hydeParkLocation, zoom: 16)
        //let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        //mapView.animate(to: camera)

        let hydePark = "tpwmEkd|y[QVe@Pk@BsHe@mGc@iNaAKMaBIYIq@qAMo@Eo@@[Fe@DoALu@HUb@c@XUZS^ELGxOhAd@@ZB`@J^BhFRlBN\\BZ@`AFrATAJAR?rAE\\C~BIpD"
        let archibaldFountain = "tlvmEqq|y[NNCXSJQOB[TI"
        let reflectionPool = "bewmEwk|y[Dm@zAPEj@{AO"

        let polygon = GMSPolygon()
        polygon.path = GMSPath(fromEncodedPath: hydePark)
        polygon.holes = [GMSPath(fromEncodedPath: archibaldFountain)!, GMSPath(fromEncodedPath: reflectionPool)!]
        polygon.fillColor = .orange//UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 0.2)
        polygon.strokeColor = .blue//UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        polygon.strokeWidth = 2
        polygon.map = mapView
        //view = mapView*/
    }
    func drawCircle(){
        
        let circleCenter = CLLocationCoordinate2D(latitude: lat + 0.005, longitude:lng + 0.005)
        let circ = GMSCircle(position: circleCenter, radius: 300)
        
        circ.fillColor = UIColor(red: 0.35, green: 0, blue: 0, alpha: 0.05)
        circ.strokeColor = .red
        circ.strokeWidth = 5
        circ.map = mapView
    }
    func drawPolyline()
    {
    
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: lat, longitude: lng))
        path.add(CLLocationCoordinate2D(latitude: lat + 0.005, longitude: lng))
        path.add(CLLocationCoordinate2D(latitude: lat + 0.005, longitude: lng - 0.005))
        path.add(CLLocationCoordinate2D(latitude: lat, longitude: lng - 0.005))
        path.add(CLLocationCoordinate2D(latitude: lat, longitude: lng))
        
        let polyline = GMSPolyline(path: path)
        
        polyline.strokeWidth = 10.0
        polyline.geodesic = true
        
        let style = GMSStrokeStyle.gradient(from: .black, to: .red)
        polyline.spans = [GMSStyleSpan(style: style)]
        
        polyline.map = mapView
    }
    func drawPolyGon()
    {
      
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: lat, longitude: lng))
        path.add(CLLocationCoordinate2D(latitude: lat - 0.005, longitude: lng))
        path.add(CLLocationCoordinate2D(latitude: lat - 0.005, longitude: lng + 0.008))
        path.add(CLLocationCoordinate2D(latitude: lat, longitude: lng + 0.008))
        path.add(CLLocationCoordinate2D(latitude: lat, longitude: lng))
        
        let polygon = GMSPolygon(path: path)
        
        polygon.strokeWidth = 10.0
        polygon.geodesic = true
        
        let style = GMSStrokeStyle.gradient(from: .black, to: .red)
        polygon.strokeColor = .yellow
        polygon.strokeWidth = 5.0
        
        polygon.fillColor = .green
        
        polygon.map = mapView
    }
    
    
    // Populate the array with the list of likely places.
    func listLikelyPlaces() {
        // Clean up from previous sessions.
        likelyPlaces.removeAll()
        
        placesClient.currentPlace(callback: { (placeLikelihoods, error) -> Void in
            if let error = error {
                // TODO: Handle the error.
                print("Current Place error: \(error.localizedDescription)")
                return
            }
            
            // Get likely places and add to the list.
            if let likelihoodList = placeLikelihoods {
                for likelihood in likelihoodList.likelihoods {
                    let place = likelihood.place
                    self.likelyPlaces.append(place)
                }
            }
        })
    }
    
    // Prepare the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //    if segue.identifier == "segueToSelect" {
        //      if let nextViewController = segue.destination as? PlacesViewController {
        //        nextViewController.likelyPlaces = likelyPlaces
        //      }
        //    }
    }
}

// Delegates to handle events for the location manager.
extension GoogleMapViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        marker.title = "Title"
        marker.snippet = "Snippet"
        marker.map = mapView
        //marker.icon = UIImage.init(named: "menu")
        
        //listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        @unknown default:
            fatalError()
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
