//
//  UIWindow+.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 29.06.2023.
//

import UIKit

extension UIWindow {
  open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    defer { super.motionEnded(motion, with: event) }
    let vc = DeeplinkViewController()
    let navController = UINavigationController(rootViewController: vc)
    
    rootViewController?.present(navController, animated: true)
  }
}

extension UIWindow {
  func transition(toVC: UIViewController, transition: CATransition?, completion: (() -> Void)? = nil) {
    
    CATransaction.begin()
    CATransaction.setCompletionBlock {
      completion?()
    }
    
    if let transition {
      transition.duration = 0.25
      transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
      layer.add(transition, forKey: kCATransition)
    }
    
    rootViewController = toVC
    makeKeyAndVisible()
    CATransaction.commit()
  }
}
