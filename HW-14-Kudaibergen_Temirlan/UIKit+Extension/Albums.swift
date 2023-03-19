//
//  Albums.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit
import SnapKit

final class Albums: UIViewController {
    
//    MARK: UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyAlbumsViewCell.self,
                                forCellWithReuseIdentifier: MyAlbumsViewCell.identifier)
        collectionView.register(PeopleAndPlacesViewCell.self,
                                forCellWithReuseIdentifier: PeopleAndPlacesViewCell.identifier)
        collectionView.register(MediaTypesViewCell.self,
                                forCellWithReuseIdentifier: MediaTypesViewCell.identifier)
        collectionView.register(UtilitiesViewCell.self,
                                forCellWithReuseIdentifier: UtilitiesViewCell.identifier)
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderSupplementaryView.identifier)
        collectionView.collectionViewLayout = createLayout()
        return collectionView
    }()
    
    let sections = MockData.shared.pageData
    
//    MARK: Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupLayout()
    }
    
//    MARK: Setup

    public func setupNavigationBar() {
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setLeftBarButton(UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "plus"),
            primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
            menu: nil), animated: true)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints{
            $0.edges.equalTo(view)
        }
    }
}

