//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Erik Sebastian de Erice Jerez on 11/8/25.
//

import Foundation
import Testing
@testable import Earthquakes

struct EarthquakesTests {
    
    @Test func geoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder(); decoder.dateDecodingStrategy = .millisecondsSince1970
        let quake = try decoder.decode(Quake.self, from: testFeature_nc73649170)
        #expect(quake.code == "73649170")
        
        let expectedSeconds = TimeInterval(1636129710550) / 1000
        let decodedSeconds = quake.time.timeIntervalSince1970
        #expect(expectedSeconds == decodedSeconds)
    }
}
