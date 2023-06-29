//
//  DeeplinkViewController.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class DeeplinkViewController: UIViewController {
  let tableView = UITableView()
  
  var items: [String] = DeeplinkKind.allCases
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "baseCell")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    title = "Deeplink open"
    view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

extension DeeplinkViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    
    guard let kind = UnauthZoneDeeplink.kind(value: item) ?? AuthZoneDeeplink.kind(value: item) else {
      print("косяк")
      return
    }
    appCoordinator?.deeplinkStart(kind: kind)
  }
}

extension DeeplinkViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "baseCell") else {
      return UITableViewCell()
    }
    
    cell.textLabel?.text = items[indexPath.row]
    cell.textLabel?.textAlignment = .center
    
    return cell
  }
}
