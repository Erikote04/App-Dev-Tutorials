//
//  QuakeDetailMap.swift
//  Earthquakes
//
//  Created by Erik Sebastian de Erice Jerez on 12/8/25.
//

import MapKit
import SwiftUI

struct QuakeDetailMap: View {
    let location: QuakeLocation
    let tintColor: Color
    
    private var place: QuakePlace
    
    @State private var position: MapCameraPosition = .automatic
    
    init(location: QuakeLocation, tintColor: Color) {
        self.location = location
        self.tintColor = tintColor
        self.place = QuakePlace(location: location)
    }
    
    var body: some View {
        Map(position: $position) {
            Marker("", coordinate: place.location)
                .tint(tintColor)
        }
        .onAppear {
            withAnimation {
                var region = MKCoordinateRegion()
                region.center = place.location
                region.span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                position = .region(region)
            }
        }
    }
}
