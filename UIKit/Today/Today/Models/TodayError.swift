//
//  TodayError.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 5/8/25.
//

import Foundation

enum TodayError: LocalizedError {
    case failedReadingReminders
    
    var errorDescription: String? {
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString(
                "Failed to read reminders",
                comment: "failed reading reminders error description"
            )
        }
    }
}
