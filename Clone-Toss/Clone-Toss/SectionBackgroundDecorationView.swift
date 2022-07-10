//
//  SectionBackgroundDecorationView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/10.
//

import UIKit

final class SectionBackgroundDecorationView: UICollectionReusableView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
