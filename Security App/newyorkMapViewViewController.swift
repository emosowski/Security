//
//  newyorkMapViewViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 12/2/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit
import MapKit

class newyorkMapViewViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialLocation = CLLocation(latitude: 40.756679, longitude: -73.972411)
        centerMapOnLocation(initialLocation)
        
        mapView.delegate = self
        
        let location = Location(title: "Vodafone New York",
                              locationName: "560 Lexington Avenue",
                              discipline: "Office",
                              coordinate: CLLocationCoordinate2D(latitude: 40.756679, longitude: -73.972411))
        
        
        mapView.addAnnotation(location)
        
        let yourAnnotationAtIndex = 0
        mapView.selectAnnotation(mapView.annotations[yourAnnotationAtIndex], animated: true)
        //automatically displays annotation info without tap
        
        

    }
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Location {
            let identifier = "artPin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Location
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}
