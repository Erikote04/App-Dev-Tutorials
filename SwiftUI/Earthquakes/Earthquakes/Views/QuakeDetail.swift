//
//  QuakeDetail.swift
//  Earthquakes
//
//  Created by Erik Sebastian de Erice Jerez on 12/8/25.
//

import SwiftUI

struct QuakeDetail: View {
    let quake: Quake
    
    var body: some View {
        VStack {
            QuakeMagnitude(quake: quake)
            
            Text(quake.place)
                .font(.title3)
                .bold()
            
            Text("\(quake.time.formatted())")
                .foregroundStyle(.secondary)
            
            if let location = quake.location {
                Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(3))))")
                Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(3))))")
            }
        }
    }
}

#Preview {
    QuakeDetail(quake: Quake.preview)
}
