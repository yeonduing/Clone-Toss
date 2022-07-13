//
//  HomeCollectionViewSection.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/11.
//

import Foundation

struct HomeCollectionViewSection: Hashable {
  let id = UUID()
  let title: String
  let items: [HomeAccountCellItem]
  
  init(title: String, items: [HomeAccountCellItem]) {
    self.title = title
    self.items = items
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
  }
}

extension HomeCollectionViewSection {
  static var allSections: [HomeCollectionViewSection] = [
    HomeCollectionViewSection(title: "토스뱅크", items: []),
    HomeCollectionViewSection(title: "자산", items: [
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      )
    ]),
    HomeCollectionViewSection(title: "소비", items: [
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      ),
      HomeAccountCellItem(
        title: "토스뱅크 통장",
        sumOfMoney: "1,000원",
        iconImage: CTImage(systemName: "person.fill")
      )
    ])
  ]
}
