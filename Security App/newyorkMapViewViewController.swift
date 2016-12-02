//
//  newyorkMapViewViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 12/2/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit
import MapKit

class newyorkMapViewViewController: UIViewController {

    @IBOutlet weak var nyMapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 500
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        nyMapView.setRegion(coordinateRegion, animated: true)
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialLocation = CLLocation(latitude: 40.756679, longitude: -73.972411)
        
        centerMapOnLocation(location: initialLocation)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
