//
//  TextViewContentView+Configuration.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 14/7/25.
//

import UIKit

extension TextViewContentView: UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        var onChange: (String) -> Void = { _ in }

        func makeContentView() -> UIView & UIContentView {
            return TextViewContentView(self)
        }
    }
}
