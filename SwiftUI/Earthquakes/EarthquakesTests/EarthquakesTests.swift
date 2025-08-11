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
    
    @Test func geoJSONDecoderDecodesGeoJSON() throws {
        let decoder = JSONDecoder(); decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(GeoJSON.self, from: testQuakesData)
        #expect(decoded.quakes.count == 6)
        #expect(decoded.quakes[0].code == "73649170")
        
        let expectedSeconds = TimeInterval(1636129710550) / 1000
        let decodedSeconds = decoded.quakes[0].time.timeIntervalSince1970
        #expect(expectedSeconds == decodedSeconds)
    }
    
    @Test func quakeDetailsDecoder() throws {
        let decoded = try JSONDecoder().decode(QuakeLocation.self, from: testDetail_hv72783692)
        #expect(decoded.latitude == 19.2189998626709)
    }
}
