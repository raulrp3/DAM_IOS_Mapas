//
//  ViewController.swift
//  DAM_IOS_Mapas
//
//  Created by raul.ramirez on 08/01/2020.
//  Copyright © 2020 Raul Ramirez. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mMapview: MKMapView!
    
    let initialLocation = CLLocation(latitude: 38.085838, longitude: -3.645547)
    let regionRadius: CLLocationDistance = 3000 //indica la distancia de tierra que nos va a mostrar el mapa.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mMapview.delegate = self
        
        self.centerMapOnLocation(location: initialLocation)
        
        let artwork = ArtWork(title: "Campus Científico-Tecnológico", locationName: "Univeridad de Jaén", discipline: "Universidad", coordinate: initialLocation.coordinate)
        
        mMapview.addAnnotation(artwork)
    }
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mMapview.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        let location = view.annotation as! ArtWork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}

extension ViewController: MKMapViewDelegate{
    //Recibe una llamada del propio sistema operativo cada vez que tenga que dibujar un annotation.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? ArtWork else { return nil }
        let identifier = "marker"
        
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
        }else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        return view
    }
}

