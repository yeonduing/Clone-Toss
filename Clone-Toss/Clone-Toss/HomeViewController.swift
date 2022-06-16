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
    
    setupUI()
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
  
  func setupUI() {
    view.backgroundColor = .systemGray5
    setupNavigation()
  }
  
  func setupNavigation() {
    title = "홈"
    tabBarItem.image = UIImage(systemName: "house.fill")
    navigationItem.title = nil
    
    setupNavigationLeftBarButtonItems()
    setupNavigationRightBarButtonItems()
  }
  
  func setupNavigationLeftBarButtonItems() {
    let chatBarButtonItem = makeNavigationBarButtonItem(
      withImage: UIImage(systemName: "bubble.left.fill"),
      action: #selector(didTabAddAccountButton),
      frame: .zero
    )
    
    let titleBarButton = UIButton(type: .system)
    titleBarButton.tintColor = .gray
    titleBarButton.setTitle("toss", for: .normal)
    titleBarButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
    titleBarButton.addTarget(
      self,
      action: #selector(didTabAddAccountButton),
      for: .touchUpInside
    )
    let titleBarButtonItem = UIBarButtonItem(customView: titleBarButton)
    
    navigationItem.leftBarButtonItems = [
      chatBarButtonItem, titleBarButtonItem
    ]
  }
  
  func setupNavigationRightBarButtonItems() {
    let accountAddBarButtonItem = makeNavigationBarButtonItem(
      withImage: UIImage(systemName: "plus"),
      action: #selector(didTabAddAccountButton)
    )
    
    let chatBarButtonItem = makeNavigationBarButtonItem(
      withImage: UIImage(systemName: "bubble.left.fill"),
      action: #selector(didTabAddAccountButton)
    )
    
    let alertBarButtonItem = makeNavigationBarButtonItem(
      withImage: UIImage(systemName: "bell.fill"),
      action: #selector(didTabAddAccountButton)
    )
    
    navigationItem.rightBarButtonItems = [
      alertBarButtonItem, chatBarButtonItem, accountAddBarButtonItem
    ]
  }
  
  func makeNavigationBarButtonItem(
    withImage image: UIImage?,
    action: Selector,
    frame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40)
  ) -> UIBarButtonItem {
    let button = UIButton(type: .system)
    button.setImage(image, for: .normal)
    button.addTarget(
      self,
      action: action,
      for: .touchUpInside
    )
    button.frame = frame
    button.tintColor = .gray
    
    return UIBarButtonItem(customView: button)
  }
  
  @objc
  func didTabAddAccountButton() {
    
  }
}
