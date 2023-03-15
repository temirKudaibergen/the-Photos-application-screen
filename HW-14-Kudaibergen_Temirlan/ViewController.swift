//
//  ViewController.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
//    MARK: UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionViwe = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViwe.backgroundColor = .none
        collectionViwe.bounces = false
        collectionViwe.delegate = self
        collectionViwe.dataSource = self
        return collectionViwe
    }()
    
    private let sections = MockData.shared.pageData
    
//    MARK: Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
//    MARK: Setup

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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

