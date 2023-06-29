//
//  DefaultButton.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class DefaultButton: UIButton {
  
  init(text: String) {
    super.init(frame: .zero)
    setTitleColor(.black, for: .normal)
    layer.borderWidth = 1
    layer.cornerRadius = 10
    backgroundColor = .white
    layer.borderColor = UIColor.black.cgColor
    setTitle(text, for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
