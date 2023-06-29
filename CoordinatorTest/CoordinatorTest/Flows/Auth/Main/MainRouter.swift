//
//  MainRouter.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

enum Tabs: Int {
  case main = 0
  case logout
  case notAddedTab
}

// MARK: - MainRouter
protocol MainRouter: NSObject {
  var tabBarController: UITabBarController? { get }
  
  func selectTab(_ tab: Tabs)
  
  func routeToSomePinkVC()
}

class MainRouterImp: NSObject, MainRouter {
  
  var tabs: [Tabs] = [.main, .logout]
  
  lazy var mainViewController: UINavigationController = {
    let vc = MainViewController()
    vc.view.backgroundColor = .systemPink
    vc.title = "Main VC"
    let navigationController = UINavigationController(rootViewController: vc)
    navigationController.navigationBar.prefersLargeTitles = true
    return navigationController
  }()
  
  lazy var logoutViewController: UINavigationController = {
    let vc = LogoutViewController()
    vc.view.backgroundColor = .systemGreen
    let navigationController = UINavigationController(rootViewController: vc)
    return navigationController
  }()
  
  weak var tabBarController: UITabBarController?
  
  func selectTab(_ tab: Tabs) {
    guard let firstIndex = tabs.firstIndex(where: { $0 == tab }) else { return }
    tabBarController?.selectedIndex = firstIndex
  }
  
  func routeToSomePinkVC() {
    let vc = DefaultViewController()
    vc.view.backgroundColor = .systemPink
    tabBarController?.show(vc, sender: nil)
  }
}
