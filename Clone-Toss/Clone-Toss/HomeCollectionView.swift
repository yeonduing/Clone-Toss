//
//  HomeCollectionView.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/10.
//

import UIKit

final class HomeCollectionView: UICollectionView {
  
  convenience init() {
    self.init(
      frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: Self.sectionProvider)
    )
    
    registerCell(ofType: HomeAccountCell.self)
    registerSupplementaryView(
      ofType: HomeSectionHeaderView.self,
      ofKind: ElementKind.sectionHeader
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
      top: 12, leading: 24, bottom: 12, trailing: 24
    )
    
    let headerSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(60)
    )
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
      layoutSize: headerSize,
      elementKind: ElementKind.sectionHeader,
      alignment: .top
    )
    section.boundarySupplementaryItems = [sectionHeader]
    
    return section
  }
}

extension UICollectionView {
  func registerCell(
    ofType cellType: UICollectionViewCell.Type,
    withReuseIdentifier identifier: String? = nil
  ) {
    let reuseIdentifier = identifier ?? String(describing: cellType.self)
    register(cellType, forCellWithReuseIdentifier: reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(
    withReuseIdentifier identifier: String? = nil,
    for indexPath: IndexPath
  ) -> T {
    let reuseIdentifier = identifier ?? String(describing: T.self)
    
    guard let cell = dequeueReusableCell(
      withReuseIdentifier: reuseIdentifier,
      for: indexPath
    ) as? T
    else {
      fatalError("dequeueReusableCell(identifier:) can not dequeue \(reuseIdentifier)")
    }
    
    return cell
  }
  
  func registerSupplementaryView(
    ofType viewType: UICollectionReusableView.Type,
    ofKind elementKind: String = UICollectionView.elementKindSectionHeader,
    withReuseIdentifier identifier: String? = nil
  ) {
    let reuseIdentifier = identifier ?? String(describing: viewType.self)
    register(
      viewType,
      forSupplementaryViewOfKind: elementKind,
      withReuseIdentifier: reuseIdentifier
    )
  }
  
  func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
    ofKind elementKind: String = UICollectionView.elementKindSectionHeader,
    withReuseIdentifier identifier: String? = nil,
    for indexPath: IndexPath
  ) -> T {
    let reuseIdentifier = identifier ?? String(describing: T.self)
    
    guard let view = dequeueReusableSupplementaryView(
      ofKind: elementKind,
      withReuseIdentifier: reuseIdentifier,
      for: indexPath
    ) as? T
    else {
      fatalError("dequeueReusableSupplementaryView(identifier:) can not dequeue \(reuseIdentifier)")
    }
    
    return view
  }
}
