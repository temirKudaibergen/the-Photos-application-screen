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
        let collectionViwe = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViwe.backgroundColor = .none
        collectionViwe.bounces = false
        collectionViwe.delegate = self
        collectionViwe.dataSource = self
        collectionViwe.register(MyAlbumsViewCell.self,
                                forCellWithReuseIdentifier: MyAlbumsViewCell.identifier)
        collectionViwe.register(PeopleAndPlacesViewCell.self,
                                forCellWithReuseIdentifier: PeopleAndPlacesViewCell.identifier)
        collectionViwe.register(MediaTypesViewCell.self,
                                forCellWithReuseIdentifier: MediaTypesViewCell.identifier)
        collectionViwe.register(UtilitiesViewCell.self,
                                forCellWithReuseIdentifier: UtilitiesViewCell.identifier)
        collectionViwe.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderSupplementaryView.identifier)
        collectionViwe.collectionViewLayout = createLayout()
        return collectionViwe
    }()
    
    let sections = MockData.shared.pageData
    
//    MARK: Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlbumsBar()
        setupViews()
        setupLayout()
    }
    
//    MARK: Setup

    func setupAlbumsBar() {
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
            $0.top.equalTo(additionalSafeAreaInsets)
            $0.edges.equalTo(view)
        }
    }
}

