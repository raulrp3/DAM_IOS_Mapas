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
        
        self.centerMapOnLocation(location: initialLocation)
        
        let artwork = ArtWork(title: "Campus Científico-Tecnológico", locationName: "Univeridad de Jaén", discipline: "Universidad", coordinate: initialLocation.coordinate)
        
        mMapview.addAnnotation(artwork)
    }
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mMapview.setRegion(coordinateRegion, animated: true)
    }
}

