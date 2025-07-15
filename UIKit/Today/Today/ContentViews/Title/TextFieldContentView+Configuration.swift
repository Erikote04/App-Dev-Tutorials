//
//  TextFieldContentView+Configuration.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 14/7/25.
//

import UIKit

extension TextFieldContentView: UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        var onChange: (String) -> Void = { _ in }
        
        func makeContentView() -> any UIView & UIContentView {
            return TextFieldContentView(self)
        }
    }
}
