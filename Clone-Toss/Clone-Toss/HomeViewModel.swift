//
//  HomeViewModel.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/07.
//

import Foundation
import RxSwift
import RxRelay

final class HomeViewModel {
  
}

struct HomeCollectionViewHeaderItem {
  let title: String
}

struct HomeAccountCellItem: Hashable {
  let id: UUID = .init()
  let title: String
  let sumOfMoney: String
  let iconImage: CTImage?
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
  }
}


protocol HomeUseCaseProtocol {
  func loadData()
}

final class HomeUseCase: HomeUseCaseProtocol {
  func loadData() {
    
  }
}
