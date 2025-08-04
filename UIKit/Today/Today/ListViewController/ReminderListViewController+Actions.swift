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
    
    @objc func didTapAddButton(_ sender: UIBarButtonItem) {
        let reminder = Reminder(title: "", dueDate: Date.now)
        let viewController = ReminderViewController(reminder: reminder) { [weak self] in
            self?.addReminder($0)
            self?.updateSnapshot()
            self?.dismiss(animated: true)
        }
        
        viewController.isAddingNewReminder = true
        viewController.setEditing(true, animated: false)
        viewController.navigationItem.title = NSLocalizedString("Add Reminder", comment: "Add Reminder view controller title")
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(didCancelAdd(_:)))
        
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
        
    }
    
    @objc func didCancelAdd(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc func didChangeListStyle(_ sender: UISegmentedControl) {
        listStyle = ReminderListStyle(rawValue: sender.selectedSegmentIndex) ?? .today
        updateSnapshot()
        refreshBackground()
    }
}
