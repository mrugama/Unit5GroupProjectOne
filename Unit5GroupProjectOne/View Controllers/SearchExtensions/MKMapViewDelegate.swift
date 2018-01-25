//
//  MKMapViewDelegate.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import MapKit

//MARK: - Map View Delegate Methods
//TODO: Make Map View Delegate Methods
//should have a map manager or something? need a map delegate!!
//should check the map view's view that is return for each annotation!

extension SearchViewController: MKMapViewDelegate {
    //to do!!
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        print(error)
        //maybe present error message about location not enabled???
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("tapped accessory!!!")
        let detailVC = VenueDetailedViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //returns the view for each annotation - the bubble thing that pops up
        
        //if annotation is the user location, don't do anything
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "mapAnnotationView") as? MKMarkerAnnotationView
        
        //the bubble that pops up when you click the annotation
        annotationView?.canShowCallout = true
        annotationView?.annotation = annotation
        annotationView?.animatesWhenAdded = true
        annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        //TODO: MELISSA CHANGE TO LIGHTER PUPRLE
        annotationView?.markerTintColor = UIColor.purple
        
        //TODO: NATE DO SHADOWS!!
        //        annotationView?.layer.shadowColor
        //        annotationView?.layer.shadowOffset
        //        annotationView?.layer.shadowRadius
        
        annotationView?.displayPriority = .required
        
        return annotationView
    }
    
}
