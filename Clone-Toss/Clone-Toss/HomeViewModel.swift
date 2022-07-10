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

struct HomeAccountCellItem {
  let title: String
  let sumOfMoney: String
  let iconImage: CTImage?
}


protocol HomeUseCaseProtocol {
  func loadData()
}

final class HomeUseCase: HomeUseCaseProtocol {
  func loadData() {
    
  }
}
