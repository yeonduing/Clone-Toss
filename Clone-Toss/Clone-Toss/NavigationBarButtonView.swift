//
//  NavigationBarButtonView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/10.
//

import UIKit
import RxSwift
import RxCocoa

final class NavigationBarButtonView: UIView {
  private let button: UIButton = .init(type: .system)
  private let dotBadgeView: DotBadgeView = .init()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var isDotbadgeViewHidden: Bool {
    get { dotBadgeView.isHidden }
    set { dotBadgeView.isHidden = newValue }
  }
  
  var buttonTintColor: UIColor? {
    get { button.tintColor }
    set { button.tintColor = newValue }
  }
  
  var dotBadgeViewColor: UIColor? {
    get { dotBadgeView.backgroundColor }
    set { dotBadgeView.backgroundColor = newValue }
  }
  
  var buttonControlEvent: ControlEvent<Void> {
    button.rx.tap
  }
  
  func setImage(_ image: UIImage?, for state: UIControl.State) {
    button.setImage(image, for: state)
  }
}

private extension NavigationBarButtonView {
  
  func setupUI() {
    buttonTintColor = .gray
  }
  
  func setupLayout() {
    [button, dotBadgeView].forEach {
      addSubview($0)
    }
    
    button.snp.makeConstraints { make in
      make.top.leading.bottom.equalToSuperview()
      make.width.height.equalTo(30)
    }
    
    dotBadgeView.snp.makeConstraints { make in
      make.top.equalTo(button.snp.top)
      make.leading.equalTo(button.snp.trailing)
      make.trailing.equalToSuperview()
      make.width.height.equalTo(6)
    }
  }
}
