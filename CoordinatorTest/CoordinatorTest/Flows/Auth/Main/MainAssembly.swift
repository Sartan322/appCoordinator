//
//  MainAssembly.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class MainAssembly {
  
  func assemle() -> (UIViewController, MainRouter) {
    let router = MainRouterImp()
    let tabBarController = MainTabBarController()
    
    router.tabBarController = tabBarController
    tabBarController.router = router
    tabBarController.tabBar.isTranslucent = false
    tabBarController.tabBar.backgroundColor = .lightGray
    
    tabBarController.viewControllers = [router.mainViewController, router.logoutViewController]
    
    router.mainViewController.tabBarItem = UITabBarItem(title: "Main VC", image: UIImage(systemName: "flag.checkered.circle"), selectedImage: UIImage(systemName: "flag.checkered.circle"))
    router.logoutViewController.tabBarItem = UITabBarItem(title: "Logout VC", image: UIImage(systemName: "network"), selectedImage: UIImage(systemName: "network"))
    
    return (tabBarController, router)
  }
}
