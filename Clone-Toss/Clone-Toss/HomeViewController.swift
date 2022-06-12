//
//  HomeViewController.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/11.
//

import UIKit

class HomeViewController: UIViewController {
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
    
    title = "홈"
    tabBarItem.image = UIImage(systemName: "house.fill")
    navigationItem.title = nil
    
    let accountAddBarButtonItem = makeNavigationRightBarButtonItem(
      withImage: UIImage(systemName: "plus"),
      action: #selector(didTabAddAccountButton)
    )
    
    let chatBarButtonItem = makeNavigationRightBarButtonItem(
      withImage: UIImage(systemName: "bubble.left.fill"),
      action: #selector(didTabAddAccountButton)
    )
    
    let alertBarButtonItem = makeNavigationRightBarButtonItem(
      withImage: UIImage(systemName: "bell.fill"),
      action: #selector(didTabAddAccountButton)
    )
    
    navigationItem.rightBarButtonItems = [
      alertBarButtonItem, chatBarButtonItem, accountAddBarButtonItem
    ]
  }
  
  override init(
    nibName nibNameOrNil: String?,
    bundle nibBundleOrNil: Bundle?
  ) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
  }
}

private extension HomeViewController {
  
  func makeNavigationRightBarButtonItem(
    withImage image: UIImage?,
    action: Selector
  ) -> UIBarButtonItem {
    let button = UIButton(type: .system)
    button.setImage(image, for: .normal)
    button.addTarget(
      self,
      action: action,
      for: .touchUpInside
    )
    button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    button.tintColor = .gray
    
    return UIBarButtonItem(customView: button)
  }
  
  @objc
  func didTabAddAccountButton() {
    
  }
}
