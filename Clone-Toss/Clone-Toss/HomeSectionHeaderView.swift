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
    
    titleLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(offset)
      make.bottom.equalToSuperview().inset(offset)
    }
    
    chevronButton.snp.makeConstraints { make in
      make.centerY.equalTo(titleLabel.snp.centerY)
      make.trailing.equalToSuperview().inset(offset)
    }
  }
}
