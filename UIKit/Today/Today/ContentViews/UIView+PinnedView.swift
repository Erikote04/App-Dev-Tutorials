//
//  UIView+PinnedView.swift
//  Today
//
//  Created by Erik Sebastian de Erice Jerez on 14/7/25.
//

import UIKit

extension UIView {
    func addPinnedSubview(
        _ subview: UIView,
        height: CGFloat? = nil,
        insets: UIEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 8)
    ) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom).isActive = true
        
        if let height {
            subview.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
