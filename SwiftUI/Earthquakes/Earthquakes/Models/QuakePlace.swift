//
//  QuakePlace.swift
//  Earthquakes
//
//  Created by Erik Sebastian de Erice Jerez on 12/8/25.
//

import Foundation
import MapKit

struct QuakePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), location: QuakeLocation) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}
