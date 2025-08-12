//
//  Quake+Preview.swift
//  Earthquakes
//
//  Created by Erik Sebastian de Erice Jerez on 12/8/25.
//

import Foundation

extension Quake {
    static var preview: Quake {
        return Quake(magnitude: 0.34,
                     place: "Shakey Acres",
                     time: Date(timeIntervalSinceNow: -1000),
                     code: "nc73649170",
                     detail: URL(string: "https://example.com")!,
                     location: QuakeLocation(latitude: 38.809_333_8, longitude: -122.796_836_9))
    }
}
