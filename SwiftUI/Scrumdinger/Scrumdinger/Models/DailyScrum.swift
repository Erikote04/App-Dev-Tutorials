//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 3/7/25.
//

import Foundation
import SwiftData
import ThemeKit

@Model
class DailyScrum: Identifiable {
    var id: UUID
    var title: String
    var lengthInMinutes: Int
    var theme: Theme
    
    @Relationship(deleteRule: .cascade, inverse: \Attendee.dailyScrum)
    var attendees: [Attendee]
    
    @Relationship(deleteRule: .cascade, inverse: \History.dailyScrum)
    var history: [History] = []
    
    var lengthInMinutesAsDouble: Double {
        get { Double(lengthInMinutes) }
        set { lengthInMinutes = Int(newValue) }
    }
    
    init(
        id: UUID = UUID(),
        title: String,
        attendees: [String],
        lengthInMinutes: Int,
        theme: Theme
    ) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
