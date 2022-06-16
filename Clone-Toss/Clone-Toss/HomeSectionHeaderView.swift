//
//  HomeSectionHeaderView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/12.
//

import UIKit

final class HomeSectionHeaderView: UICollectionReusableView {
  private let titleLabel = UILabel()
  private let chevronButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(title: String, isChevronButtonHidden: Bool = false) {
    titleLabel.text = title
    chevronButton.isHidden = isChevronButtonHidden
  }
}

private extension HomeSectionHeaderView {
  
  func setupUI() {
    titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
    chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    chevronButton.tintColor = .gray
  }
  
  func setupLayout() {
    [titleLabel, chevronButton].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let offset: CGFloat = 16
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: offset),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
      
      chevronButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
      chevronButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset)
    ])
  }
}
