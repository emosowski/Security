//
//  newyorkMapViewViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 12/2/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit
import MapKit

class newyorkMapViewViewController: UIViewController, WeatherGetterDelegate, MKMapViewDelegate,
UITextFieldDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    
 

    

    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather = WeatherGetter(delegate: self)
        
        // Initialize UI
        // -------------
        cityLabel.text = "simple weather"
        weatherLabel.text = ""
        temperatureLabel.text = ""
        cloudCoverLabel.text = ""
        windLabel.text = ""
        rainLabel.text = ""
        humidityLabel.text = ""
        cityTextField.text = ""
        cityTextField.placeholder = "Enter city name"
        cityTextField.delegate = self
        cityTextField.enablesReturnKeyAutomatically = true
        getCityWeatherButton.isEnabled = false

        
        

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
 
        
        cityLabel.text = "simple weather"
        temperatureLabel.text = ""
        
        weather.getWeather(city: "Tampa")


    

    }
    
    @IBAction func getWeatherForCityButtonTapped(_ sender: UIButton) {
        guard let text = cityTextField.text, !text.isEmpty else {
            return
        }
        weather.getWeather(cityTextField.text!.urlEncoded)
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
    
    func didGetWeather(weather: Weather) {
        // This method is called asynchronously, which means it won't execute in the main queue.
        // ALl UI code needs to execute in the main queue, which is why we're wrapping the code
        // that updates all the labels in a dispatch_async() call.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.cityLabel.text = weather.city
//            self.weatherLabel.text = weather.weatherDescription
            self.temperatureLabel.text = "\(Int(round(weather.tempCelsius)))°"
//            self.cloudCoverLabel.text = "\(weather.cloudCover)%"
//            self.windLabel.text = "\(weather.windSpeed) m/s"
//            
//            if let rain = weather.rainfallInLast3Hours {
//                self.rainLabel.text = "\(rain) mm"
//            }
//            else {
//                self.rainLabel.text = "None"
//            }
//            
//            self.humidityLabel.text = "\(weather.humidity)%"
        }
    }
    
    func didNotGetWeather(error: NSError) {
        // This method is called asynchronously, which means it won't execute in the main queue.
        // ALl UI code needs to execute in the main queue, which is why we're wrapping the call
        // to showSimpleAlert(title:message:) in a dispatch_async() call.
        DispatchQueue.main.async {
//            self.showSimpleAlert(title: "Can't get the weather",
//                                 message: "The weather service isn't responding.")
        }
        print("didNotGetWeather error: \(error)")
    }


}
