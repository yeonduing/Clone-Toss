//
//  HomeSectionHeaderView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/12.
//

import UIKit

final class HomeSectionHeaderView: UICollectionReusableView {
  let titleLabel = UILabel()
  private let chevronButton = UIButton()
  private var titleLabelLayoutConstraint: NSLayoutConstraint?
  
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
  
  func configureLayoutConstraint(offset: CGFloat) {
    titleLabelLayoutConstraint?.constant = offset
  }
}

private extension HomeSectionHeaderView {
  
  func setupUI() {
    backgroundColor = .systemBackground
    layer.cornerRadius = 20
    layer.cornerCurve = .continuous
    
    titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
    chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    chevronButton.tintColor = .gray
  }
  
  func setupLayout() {
    [titleLabel, chevronButton].forEach {
      addSubview($0)
    }
    
    let offset: CGFloat = 20
    
    titleLabelLayoutConstraint = titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
    titleLabelLayoutConstraint?.isActive = true
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(offset)
      make.bottom.equalToSuperview().inset(offset)
    }
    
    chevronButton.snp.makeConstraints { make in
      make.centerY.equalTo(titleLabel.snp.centerY)
      make.trailing.equalToSuperview().inset(offset)
    }
  }
}
