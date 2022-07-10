//
//  DotBadgeView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/07.
//

import UIKit

final class DotBadgeView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .red
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
      super.draw(rect)
      circle()
  }
}
