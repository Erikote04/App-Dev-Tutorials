//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 8/7/25.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(
        id: UUID = UUID(),
        error: Error,
        guidance: String
    ) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
