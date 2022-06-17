//
//  HomeAccountCell.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/16.
//

import UIKit

final class HomeAccountCell: UICollectionViewCell {
  private let iconImageView = UIImageView()
  private let titleLabel = UILabel()
  private let sumOfMoneyLabel = UILabel()
  private let button = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension HomeAccountCell {
  
  func setupUI() {
    iconImageView.layer.cornerRadius = 22
    iconImageView.layer.cornerCurve = .circular
    
    titleLabel.font = .systemFont(ofSize: 10)
    titleLabel.textColor = .black
    
    sumOfMoneyLabel.font = .systemFont(ofSize: 12, weight: .medium)
    sumOfMoneyLabel.textColor = .black
    
    button.layer.cornerRadius = 4
    button.layer.cornerCurve = .continuous
    button.backgroundColor = .systemGray6
    button.setTitleColor(.gray, for: .normal)
  }
  
  func setupLayout() {
    let labelStackView = UIStackView()
    labelStackView.axis = .vertical
    labelStackView.alignment = .leading
    labelStackView.distribution = .fill
    labelStackView.spacing = 0
    labelStackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    
    [titleLabel, sumOfMoneyLabel].forEach {
      labelStackView.addArrangedSubview($0)
    }
    
    let stackView = UIStackView()
    stackView.alignment = .fill
    stackView.spacing = 10
    
    [iconImageView, labelStackView, button].forEach {
      stackView.addArrangedSubview($0)
    }
  }
}
