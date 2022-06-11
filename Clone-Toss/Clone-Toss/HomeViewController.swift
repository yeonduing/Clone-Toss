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
    
    let accountAddBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "plus"),
      style: .plain,
      target: self,
      action: #selector(didTabAddAccountButton)
    )
    accountAddBarButtonItem.tintColor = .gray
    
    let chatBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "bubble.left.fill"),
      style: .plain,
      target: self,
      action: #selector(didTabAddAccountButton)
    )
    chatBarButtonItem.tintColor = .gray
    
    let alertBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "bell.fill"),
      style: .plain,
      target: self,
      action: #selector(didTabAddAccountButton)
    )
    alertBarButtonItem.tintColor = .gray
    
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
  
  @objc
  func didTabAddAccountButton() {
    
  }
}
