//
//  UIStackView+.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

extension UIStackView {
  public func addArrangedSubviews(_ views: [UIView]) {
    views.forEach { addArrangedSubview($0) }
  }
}
