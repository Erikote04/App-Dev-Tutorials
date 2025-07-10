//
//  History.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 8/7/25.
//

import Foundation
import SwiftData

@Model
class History: Identifiable {
    var id: UUID
    var date: Date
    var attendees: [Attendee]
    var dailyScrum: DailyScrum?
    var transcript: String?
    
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
    
    init(
        id: UUID = UUID(),
        date: Date = Date(),
        attendees: [Attendee],
        transcript: String? = nil
    ) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.transcript = transcript
    }
}
