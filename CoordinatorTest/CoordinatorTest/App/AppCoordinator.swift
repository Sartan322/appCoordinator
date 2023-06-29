//
//  AppCoordinator.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

final class AppCoordinator {
  
  public static let shared = AppCoordinator()
  
  /// Window
  weak var window: UIWindow?
  
#warning("Нужно ли нам иметь один основной НавКонтроллер?")
  /// По сути нужно раз мы хотим иметь полное представление о текущем состоянии
  private var mainNavController = UINavigationController()
  
  // MARK: - Services
  private let authCredentials: AuthCredentials = AuthCredentialsImp.shared
  
  // MARK: - Properties
  private var isAuthorized: Bool { authCredentials.isAuthorized }
  
  /// Неавторизованная зона
  weak var loginRouter: LoginRouter?
  
  /// Авторизованная зона
  weak var mainRouter: MainRouter?
  
  private init() {}
  
  // MARK: - Main method
  @MainActor
  func start() async {
    await isAuthorized ? showMain() : showLogin()
  }
  
  func deeplinkStart(kind: DeeplinkKind) {
    
    Task { @MainActor in
      await withCheckedContinuation { continuation in
        mainNavController.presentedViewController?.dismiss(animated: true) {
          continuation.resume()
        }
      }
      switch kind {
      case .unauthZone(let unauthZoneDeeplink):
        if isAuthorized {
          AuthCredentialsImp.shared.setup(isAuthorized: false)
          await showLogin()
        }
        switch unauthZoneDeeplink {
        case .unathMain:
          break
        case .forgot:
          loginRouter?.routeToForgotPassword()
        }
        
      case .authZone(let authZoneDeeplink):
        
        if !isAuthorized {
          // Тут континуэйшен на ожидание логина, а пока сразу вызов открытия мейна
          await showMain()
        }
        switch authZoneDeeplink {
        case .authMain:
          mainRouter?.selectTab(.main)
        case .somePinkVC:
          mainRouter?.routeToSomePinkVC()
        case .logout:
          mainRouter?.selectTab(.logout)
        }
      }
    }
  }
}

extension AppCoordinator {
  @MainActor
  private func showLogin() async {
    guard let window else { return }
    
    if loginRouter == nil {
      let (vc, router) = LoginAssembly().assemble()
      
      loginRouter = router
      let navController = UINavigationController(rootViewController: vc)
      
      let transition = CATransition()
      transition.type = .push
      transition.subtype = .fromTop
      
      await withCheckedContinuation { continuation in
        window.transition(toVC: navController, transition: transition) { [navController] in
          self.mainNavController = navController
          continuation.resume()
        }
      }
    }
  }
  
  @MainActor
  private func showMain() async {
    guard let window else { return }
    
    if mainRouter == nil {
      let (vc, router) = MainAssembly().assemle()
      mainRouter = router
      
      let navController = UINavigationController(rootViewController: vc)
      
      let transition = CATransition()
      transition.type = .push
      transition.subtype = .fromTop
      
      await withCheckedContinuation { continuation in
        window.transition(toVC: navController, transition: transition) { [navController] in
          self.mainNavController = navController
          continuation.resume()
        }
      }
    }
  }
}
