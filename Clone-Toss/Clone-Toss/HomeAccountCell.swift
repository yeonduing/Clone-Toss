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
  
  func configureCell(with viewModel: HomeAccountCellItem) {
    iconImageView.image = viewModel.iconImage
    titleLabel.text = viewModel.title
    sumOfMoneyLabel.text = viewModel.sumOfMoney
  }
}

private extension HomeAccountCell {
  
  func setupUI() {
    iconImageView.circle()
    
    titleLabel.font = .systemFont(ofSize: 16)
    titleLabel.textColor = .black
    
    sumOfMoneyLabel.font = .systemFont(ofSize: 18, weight: .medium)
    sumOfMoneyLabel.textColor = .black
    
    button.layer.cornerRadius = 4
    button.layer.cornerCurve = .continuous
    button.backgroundColor = .systemGray6
    button.setTitleColor(.gray, for: .normal)
    button.setTitle("송금", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 16)
    button.contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
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
    stackView.alignment = .center
    stackView.spacing = 10
    
    [iconImageView, labelStackView, button].forEach {
      stackView.addArrangedSubview($0)
    }
    
    contentView.addSubview(stackView)
    
    stackView.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(20)
      make.bottom.trailing.equalToSuperview().inset(20)
    }
  }
}
