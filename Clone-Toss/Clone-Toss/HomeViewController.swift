//
//  HomeViewController.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/06/11.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxGesture

final class HomeViewController: UIViewController {
  typealias Snapshot = NSDiffableDataSourceSnapshot<HomeCollectionViewSection, HomeAccountCellItem>
  typealias DataSource = UICollectionViewDiffableDataSource<HomeCollectionViewSection, HomeAccountCellItem>
  
  private let accountAddBarButtonView: NavigationBarButtonView = .init()
  private let chatBarButtonView: NavigationBarButtonView = .init()
  private let alertBarButtonView: NavigationBarButtonView = .init()
  
  private let collectionView: HomeCollectionView = .init()
  
  private let disposeBag = DisposeBag()
  
  private lazy var dataSource = makeDataSource()
  private var sections = HomeCollectionViewSection.allSections
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
    
    setupUI()
    setupLayout()
    applySnapshot()
  }
  
  override init(
    nibName nibNameOrNil: String?,
    bundle nibBundleOrNil: Bundle?
  ) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    setupTabBar()
  }
}

private extension HomeViewController {
  
  func setupUI() {
    view.backgroundColor = .systemGray5
    setupNavigation()
  }
  
  func setupLayout() {
    view.addSubview(collectionView)
    
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func setupNavigation() {
    title = "홈"
    tabBarItem.image = UIImage(systemName: "house.fill")
    navigationItem.title = nil
    
    setupNavigationBlurEffect()
    setupNavigationLeftBarButtonItems()
    setupNavigationRightBarButtonItems()
  }
  
  func setupNavigationBlurEffect() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    appearance.backgroundEffect = UIBlurEffect(style: .light)

    UINavigationBar.appearance().standardAppearance = appearance
  }
  
  func setupNavigationLeftBarButtonItems() {
    let titleBarButton = UIButton(type: .system)
    titleBarButton.tintColor = .gray
    titleBarButton.setTitle("toss", for: .normal)
    titleBarButton.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
    titleBarButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
    let titleBarButtonItem = UIBarButtonItem(customView: titleBarButton)
    
    navigationItem.leftBarButtonItems = [
      titleBarButtonItem
    ]
  }
  
  func setupNavigationRightBarButtonItems() {
    let accountAddBarButtonItem = UIBarButtonItem(customView: accountAddBarButtonView)
    accountAddBarButtonView.setImage(UIImage(systemName: "plus"), for: .normal)
    accountAddBarButtonView.isDotbadgeViewHidden = true
    alertBarButtonView.buttonControlEvent
      .subscribe(onNext: {
        print("hello")
      })
      .disposed(by: disposeBag)
    
    let chatBarButtonItem = UIBarButtonItem(customView: chatBarButtonView)
    chatBarButtonView.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
    alertBarButtonView.buttonControlEvent
      .subscribe(onNext: {
        print("hello")
      })
      .disposed(by: disposeBag)
    
    let alertBarButtonItem = UIBarButtonItem(customView: alertBarButtonView)
    alertBarButtonView.setImage(UIImage(systemName: "bell.fill"), for: .normal)
    alertBarButtonView.buttonControlEvent
      .subscribe(onNext: {
        print("hello")
      })
      .disposed(by: disposeBag)
    
    navigationItem.rightBarButtonItems = [
      alertBarButtonItem, chatBarButtonItem, accountAddBarButtonItem
    ]
  }
}

private extension HomeViewController {
  
  func setupTabBar() {
    tabBarController?.tabBar.layer.masksToBounds = true
    tabBarController?.tabBar.isTranslucent = true
    let appearance = UITabBarAppearance()
    appearance.configureWithOpaqueBackground()
    tabBarController?.tabBar.standardAppearance = appearance
    tabBarController?.tabBar.layer.borderWidth = 0.5
    tabBarController?.tabBar.layer.borderColor = UIColor.systemGray4.cgColor
    tabBarController?.tabBar.clipsToBounds = true
    if #available(iOS 15.0, *) {
      tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    tabBarController?.tabBar.layer.cornerRadius = 20
    tabBarController?.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }
}

extension HomeViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    true
  }
}

private extension HomeViewController {
  
  func makeDataSource() -> DataSource {
    let dataSource = DataSource(
      collectionView: collectionView,
      cellProvider: { [disposeBag] (collectionView, indexPath, video) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(for: indexPath) as HomeAccountCell
        cell.configureCell(with: HomeAccountCellItem(title: "hello", sumOfMoney: "1,000원", iconImage: UIImage(systemName: "person.fill")))
        
        let cellLongPressGesture = cell.rx.longPressGesture(
          configuration: { gestureRecognizer, delegate in
            gestureRecognizer.minimumPressDuration = 0
            gestureRecognizer.delaysTouchesBegan = false
            gestureRecognizer.delaysTouchesEnded = false
          }
        )
        
        cellLongPressGesture
          .when(.began)
          .asDriver(onErrorJustReturn: .init())
          .drive(onNext: { _ in
            cell.contentView.backgroundColor = .systemGray6
          })
          .disposed(by: disposeBag)
        
        cellLongPressGesture
          .when(.ended)
          .asDriver(onErrorJustReturn: .init())
          .drive(onNext: { _ in
            cell.contentView.backgroundColor = .clear
          })
          .disposed(by: disposeBag)
        
        return cell
      })
    
    dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
      guard kind == HomeCollectionView.ElementKind.sectionHeader else {
        return nil
      }
      let section = self?.dataSource.snapshot().sectionIdentifiers[indexPath.section]
      let headerView = collectionView.dequeueReusableSupplementaryView(
        ofKind: HomeCollectionView.ElementKind.sectionHeader,
        for: indexPath
      ) as HomeSectionHeaderView
      
      headerView.configure(title: section?.title ?? "")
      
      return headerView
    }
    
    return dataSource
  }
  
  func applySnapshot(animatingDifferences: Bool = true) {
    var snapshot = Snapshot()
    snapshot.appendSections(sections)
    sections.forEach { section in
      snapshot.appendItems(section.items, toSection: section)
    }
    dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
  }
}
