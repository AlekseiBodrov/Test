//
//  UIView+Extension.swift
//  Students-test-project
//
//  Created by Алексей on 03.02.2023.
//

import UIKit

extension UIView {
    func rounded(radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
    }

    func create(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
