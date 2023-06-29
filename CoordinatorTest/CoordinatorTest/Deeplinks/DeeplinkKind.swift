//
//  DeeplinkKind.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import Foundation

enum DeeplinkKind {
  case unauthZone(UnauthZoneDeeplink)
  case authZone(AuthZoneDeeplink)
  
  static var allCases: [String] = UnauthZoneDeeplink.allCases.map { $0.rawValue } + AuthZoneDeeplink.allCases.map { $0.rawValue }
}

enum UnauthZoneDeeplink: String, CaseIterable {
  case unathMain
  case forgot
  
  static func kind(value: String) -> DeeplinkKind? {
    guard let kind = UnauthZoneDeeplink(rawValue: value) else { return nil }
    return .unauthZone(kind)
  }
}

enum AuthZoneDeeplink: String, CaseIterable {
  case authMain
  case somePinkVC
  case logout
  
  static func kind(value: String) -> DeeplinkKind? {
    guard let kind = AuthZoneDeeplink(rawValue: value) else { return nil }
    return .authZone(kind)
  }
}
