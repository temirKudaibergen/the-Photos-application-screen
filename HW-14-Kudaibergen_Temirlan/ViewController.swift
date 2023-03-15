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
        switch sections[indexPath.section] {
        case .myAlbums(let myAlbums):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsViewCell.identifier, for: indexPath) as? MyAlbumsViewCell
            else { return UICollectionViewCell()}
            cell.configureCell(imageName: myAlbums[indexPath.row].image,
                               title: myAlbums[indexPath.row].title,
                               filesCount: myAlbums[indexPath.row].countFiles)
            return cell
            
        case .peopleAndPlaces(let peopleAndPlaces):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleAndPlacesViewCell.identifier, for: indexPath) as? PeopleAndPlacesViewCell
            else { return UICollectionViewCell()}
            cell.configureCell(imageName: peopleAndPlaces[indexPath.row].image,
                               title: peopleAndPlaces[indexPath.row].title,
                               filesCount: peopleAndPlaces[indexPath.row].countFiles)
            return cell
            
        case .mediaTypes(let mediaTypes):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypesViewCell.identifier, for: indexPath) as? MediaTypesViewCell
            else { return UICollectionViewCell()}
            cell.configureCell(imageName: mediaTypes[indexPath.row].image,
                               title: mediaTypes[indexPath.row].title,
                               filesCount: mediaTypes[indexPath.row].countFiles)
            return cell
            
        case .utilities(let utilities):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UtilitiesViewCell.identifier, for: indexPath) as? UtilitiesViewCell
            else { return UICollectionViewCell()}
            cell.configureCell(imageName: utilities[indexPath.row].image,
                               title: utilities[indexPath.row].title,
                               filesCount: utilities[indexPath.row].countFiles)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "header",
                                                                         for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
            
        }
    }
    
//    MARK: Creat Layout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil}
            let section = self.sections[sectionIndex]
            switch section {
            case .myAlbums(_):
                return self.creatMyAlbumsSections()
            case .peopleAndPlaces(_):
                return self.creatPeopleAndPlaceSections()
            case .mediaTypes(_):
                return self.creatMediaTypesSections()
            case .utilities(_):
                return self.creatUtilitiesSections()
            }
        }
        
    }
    
    private func creatMyAlbumsSections() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 2.5, bottom: 10, trailing: 2.5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                               heightDimension: .fractionalWidth(1 / 1.9 * 2))
        
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        
        layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 50, trailing: 5)
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        
        return sectionLayout
    }
    
    private func creatPeopleAndPlaceSections() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 2.5, bottom: 5, trailing: 2.5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                               heightDimension: .fractionalWidth(1 / 1.9 * 2))
        
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        
        layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 50, trailing: 5)
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        
        return sectionLayout
    }
    
    private func creatMediaTypesSections() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(44))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        
        return sectionLayout
    }
    
    private func creatUtilitiesSections() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(44))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        
        return sectionLayout
    }
    
    
}

