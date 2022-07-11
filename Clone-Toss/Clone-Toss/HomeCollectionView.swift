//
//  HomeCollectionView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/10.
//

import UIKit

final class HomeCollectionView: UICollectionView {
  
  convenience init() {
    let configuration: UICollectionViewCompositionalLayoutConfiguration = .init()
    configuration.interSectionSpacing = 16
    
    self.init(
      frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(
        sectionProvider: Self.sectionProvider,
        configuration: configuration
      )
    )
    
    backgroundColor = .clear
    
    registerCell(ofType: HomeAccountCell.self)
    registerSupplementaryView(
      ofType: HomeSectionHeaderView.self,
      ofKind: ElementKind.sectionHeader
    )
    collectionViewLayout.register(
      SectionBackgroundDecorationView.self,
      forDecorationViewOfKind: ElementKind.background
    )
  }
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(
      frame: frame,
      collectionViewLayout: layout
    )
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  enum ElementKind {
    static let sectionHeader = "sectionHeader"
    static let background = "background"
  }
}

private extension HomeCollectionView {
  static func sectionProvider(
    sectionIndex: Int,
    layoutEnvironment: NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutSection? {
    return makeListSectionLayout()
  }
  
  static func makeListSectionLayout() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .fractionalHeight(1.0)
    )
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .absolute(80)
    )
    let columns = 1
    let group = NSCollectionLayoutGroup.vertical(
      layoutSize: groupSize,
      subitem: item,
      count: columns
    )
    
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(
      top: 0, leading: 16, bottom: 0, trailing: 16
    )
    
    let headerSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(52)
    )
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
      layoutSize: headerSize,
      elementKind: ElementKind.sectionHeader,
      alignment: .top
    )
    section.boundarySupplementaryItems = [sectionHeader]
    
    let sectionBackground = NSCollectionLayoutDecorationItem.background(
      elementKind: ElementKind.background)
    sectionBackground.contentInsets = NSDirectionalEdgeInsets(
      top: 0, leading: 16, bottom: 0, trailing: 16
    )
    
    section.decorationItems = [sectionBackground]
    
    return section
  }
}
