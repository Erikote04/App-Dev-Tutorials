//
//  ReminderListViewController+Action.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 10/7/25.
//

import UIKit

extension ReminderListViewController {
    @objc func didTapDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
