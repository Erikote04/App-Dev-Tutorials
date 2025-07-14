//
//  DatePickerContentView+Configuration.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 14/7/25.
//

import UIKit

extension DatePickerContentView: UIContentView {
    struct Configuration: UIContentConfiguration {
        var date = Date.now

        func makeContentView() -> UIView & UIContentView {
            return DatePickerContentView(self)
        }
    }
}
