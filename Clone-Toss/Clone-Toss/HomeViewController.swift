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

