//
//  VCMapView.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 12/8/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//
import Foundation
import MapKit

extension ViewController: MKMapViewDelegate {
    
//     1
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
//    {
//        if annotation is MKUserLocation {return nil}
//        
//        let reuseId = "pin"
//        
//        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
//        if pinView == nil {
//            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            pinView!.canShowCallout = true
//            pinView!.animatesDrop = true
//            let calloutButton = UIButton(type: .detailDisclosure)
//            pinView!.rightCalloutAccessoryView = calloutButton
//            pinView!.sizeToFit()
//        }
//        else {
//            pinView!.annotation = annotation
//        }
//        
//        
//        return pinView
//    }
//    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        if control == view.rightCalloutAccessoryView {
//            print("button tapped")
//        }
//    }
}
