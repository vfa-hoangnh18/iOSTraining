//
//  Demo15ViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/15/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit
import MapKit

class Demo15ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        let currentLocation = locationManager.location?.coordinate
        let srcLocation = CLLocationCoordinate2D(latitude: currentLocation!.latitude + 0.001, longitude:currentLocation!.longitude)
        let destLocation = CLLocationCoordinate2D(latitude: currentLocation!.latitude - 0.001, longitude:currentLocation!.longitude)
        
        
        let srcAnnotation = CustomAnnotation(title: "Source", subtitle: "SubTitle", coord: srcLocation, image: UIImage(named: "menu")!)
        let destAnnotation = CustomAnnotation(title: "Destination", subtitle: "SubTitle", coord: destLocation, image: UIImage(named: "menu")!)
        
        mapView.addAnnotation(srcAnnotation)
        mapView.addAnnotation(destAnnotation)
        
        // Do any additional setup after loading the view.
        
        drawLineTwoLocation(srcLocation: srcLocation, destLocation: destLocation)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last
        let region = MKCoordinateRegion(center: currentLocation!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let myAnnotation = annotation as? CustomAnnotation{
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: "CustomPinAnnotationView")
            if (pinView == nil){
                pinView = MKAnnotationView(annotation: myAnnotation, reuseIdentifier: "CustomPinAnnotationView")
                pinView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                pinView?.canShowCallout = true
                pinView?.calloutOffset = CGPoint(x: 0, y: 4)
                pinView?.contentMode = .scaleAspectFill
            }else{
                pinView?.annotation = annotation
            }
            pinView?.image = myAnnotation.image
            return pinView
        }
        return nil
    }
    func drawLineTwoLocation(srcLocation: CLLocationCoordinate2D, destLocation: CLLocationCoordinate2D){
        //step 1
        let srcPlaceMark = MKPlacemark(coordinate: srcLocation)
        let destPlaceMark = MKPlacemark(coordinate: destLocation)
        //step 2
        let srcMapItem = MKMapItem(placemark: srcPlaceMark)
        let destMapItem = MKMapItem(placemark: destPlaceMark)
        //step 3
        let directRequest = MKDirections.Request()
        directRequest.source = srcMapItem
        directRequest.destination = destMapItem
        
        directRequest.transportType = .any
        
        //step 4
        let directions = MKDirections(request: directRequest)
        directions.calculate { (response, error) in
            if error == nil {
                /*if let route = response?.routes.first{
                    self.mapView.addOverlay(route.polyline, level: .aboveRoads)
                    
                    let rect = route.polyline.boundingMapRect
                    self.mapView.setVisibleMapRect(rect, animated: true)
                }*/
                print(response!.routes.count)
                for route in response!.routes{
                    self.mapView.addOverlay(route.polyline, level: .aboveRoads)
                }
            }else{
                print(error?.localizedDescription)
            }
        }
        
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.systemPink
        renderer.lineWidth = 5.0
        return renderer
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
