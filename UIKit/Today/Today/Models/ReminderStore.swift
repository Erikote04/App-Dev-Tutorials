//
//  ReminderStore.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 5/8/25.
//

import EventKit
import Foundation

final class ReminderStore {
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .fullAccess
    }
}
