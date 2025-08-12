//
//  CacheEntry.swift
//  Earthquakes
//
//  Created by Erik Sebastian de Erice Jerez on 12/8/25.
//

import Foundation

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}

final class CacheEntryObject {
    let entry: CacheEntry
    
    init(entry: CacheEntry) {
        self.entry = entry
    }
}
