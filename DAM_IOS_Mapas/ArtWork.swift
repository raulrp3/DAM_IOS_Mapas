//
//  ArtWork.swift
//  DAM_IOS_Mapas
//
//  Created by raul.ramirez on 08/01/2020.
//  Copyright © 2020 Raul Ramirez. All rights reserved.
//

import Foundation
import MapKit

class ArtWork: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let locationName: String
    let discipline: String
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
