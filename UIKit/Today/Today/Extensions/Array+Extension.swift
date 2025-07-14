//
//  Array+Extension.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 14/7/25.
//

import Foundation

extension Array where Element == Reminder {
    func indexOfReminder(withId id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        
        return index
    }
}
