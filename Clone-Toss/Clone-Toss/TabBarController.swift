//
//  TabBarController.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/11.
//

import UIKit

final class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabBar.tintColor = .black
    
    let homeViewController = HomeViewController()
    let homeNavigationController = UINavigationController(rootViewController: homeViewController)
    
    setViewControllers([homeNavigationController], animated: false)
  }
}
