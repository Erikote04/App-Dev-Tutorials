//
//  EKEventStore+Extension.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 5/8/25.
//

import EventKit
import Foundation

extension EKEventStore {
    func getReminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
