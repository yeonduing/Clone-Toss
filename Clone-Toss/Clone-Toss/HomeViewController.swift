//
//  HomeViewController.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/11.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
  private let accountAddBarButtonView: NavigationBarButtonView = .init()
  private let chatBarButtonView: NavigationBarButtonView = .init()
  private let alertBarButtonView: NavigationBarButtonView = .init()
  
  private let disposeBag = DisposeBag()
  
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
    let titleBarButton = UIButton(type: .system)
    titleBarButton.tintColor = .gray
    titleBarButton.setTitle("toss", for: .normal)
    titleBarButton.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
    titleBarButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
    let titleBarButtonItem = UIBarButtonItem(customView: titleBarButton)
    
    navigationItem.leftBarButtonItems = [
      titleBarButtonItem
    ]
  }
  
  func setupNavigationRightBarButtonItems() {
    let accountAddBarButtonItem = UIBarButtonItem(customView: accountAddBarButtonView)
    accountAddBarButtonView.setImage(UIImage(systemName: "plus"), for: .normal)
    accountAddBarButtonView.isDotbadgeViewHidden = true
    alertBarButtonView.buttonControlEvent
      .subscribe(onNext: {
        print("hello")
      })
      .disposed(by: disposeBag)
    
    let chatBarButtonItem = UIBarButtonItem(customView: chatBarButtonView)
    chatBarButtonView.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
    alertBarButtonView.buttonControlEvent
      .subscribe(onNext: {
        print("hello")
      })
      .disposed(by: disposeBag)
    
    let alertBarButtonItem = UIBarButtonItem(customView: alertBarButtonView)
    alertBarButtonView.setImage(UIImage(systemName: "bell.fill"), for: .normal)
    alertBarButtonView.buttonControlEvent
      .subscribe(onNext: {
        print("hello")
      })
      .disposed(by: disposeBag)
    
    navigationItem.rightBarButtonItems = [
      alertBarButtonItem, chatBarButtonItem, accountAddBarButtonItem
    ]
  }
}

private extension HomeViewController {
  
}
