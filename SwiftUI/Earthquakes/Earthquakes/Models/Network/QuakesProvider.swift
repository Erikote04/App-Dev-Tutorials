//
//  QuakeProvider.swift
//  Earthquakes
//
//  Created by Erik Sebastian de Erice Jerez on 11/8/25.
//

import Foundation
import Observation

@Observable
class QuakesProvider {
    var quakes: [Quake] = []
    
    let client: QuakeClient
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
    
    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }
    
    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
    
    func getLocation(for quake: Quake) async throws -> QuakeLocation {
        return try await client.getQuakeLocation(from: quake.detail)
    }
}
