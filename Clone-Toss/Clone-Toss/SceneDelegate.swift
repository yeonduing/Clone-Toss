//
//  SceneDelegate.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = TabBarController()
    self.window = window
    window.makeKeyAndVisible()
  }
}

