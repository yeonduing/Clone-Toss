//
//  HomeCollectionView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/10.
//

import UIKit

final class HomeCollectionView: UICollectionView {
  
  enum Constants {
    static let interSectionSpacing: CGFloat = 16
    static let cellHeight: CGFloat = 80
    static let headerViewHeight: CGFloat = 66.33
  }
  
  convenience init() {
    let configuration: UICollectionViewCompositionalLayoutConfiguration = .init()
    configuration.interSectionSpacing = Constants.interSectionSpacing
    
    self.init(
      frame: .zero, collectionViewLayout: StickyHeaderCollectionViewCompositionalLayout(
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
      heightDimension: .absolute(Constants.cellHeight)
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
      heightDimension: .absolute(Constants.headerViewHeight)
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

final class StickyHeaderCollectionViewCompositionalLayout: UICollectionViewCompositionalLayout {
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    
    guard
      let collectionView = collectionView,
      let superAttributes = super.layoutAttributesForElements(in: rect)
    else {
      return super.layoutAttributesForElements(in: rect) // nil
    }
    
    let contentOffset = collectionView.contentOffset
    
    superAttributes.forEach { layoutAttributes in
      guard
        layoutAttributes.representedElementKind != nil,
        layoutAttributes.indexPath.section == 2
      else { return }
      
      let numberOfItemsInSection = collectionView.numberOfItems(inSection: 1)
      
      let interSectionSpacing: CGFloat = HomeCollectionView.Constants.interSectionSpacing
      let cellHeight: CGFloat = HomeCollectionView.Constants.cellHeight
      let headerViewHeight: CGFloat = HomeCollectionView.Constants.headerViewHeight
      let comparedOffset: CGFloat = headerViewHeight + interSectionSpacing + interSectionSpacing + headerViewHeight + cellHeight * CGFloat(numberOfItemsInSection)

      let tabBarHeight: CGFloat = 83
      let collectionViewOffset: CGFloat = UIScreen.main.bounds.height - headerViewHeight - tabBarHeight
      
      var origin = layoutAttributes.frame.origin
      origin.y = min(contentOffset.y + collectionViewOffset, comparedOffset)
      
      var size = layoutAttributes.frame.size
      let offset: CGFloat = 16
      size.width = UIScreen.main.bounds.width - 16*2
      origin.x = offset
      if contentOffset.y + collectionViewOffset < comparedOffset {
        origin.x = 0
        size.width = UIScreen.main.bounds.width
      }
      layoutAttributes.frame = CGRect(origin: origin, size: size)
      
    }
    
    return superAttributes
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    
    return true
  }
}
