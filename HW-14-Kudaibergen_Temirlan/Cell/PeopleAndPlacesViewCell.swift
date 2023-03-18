//
//  PeopleAndPlacesViewCell.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit
import SnapKit

class PeopleAndPlacesViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "PeopleAndPlacesViewCell"

    // MARK: UI
    
    private let albumsImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let albumsTitle: UILabel = {
       let lable = UILabel()
        return lable
    }()
    
    private let filesCountInAlbum: UILabel = {
       let lable = UILabel()
        return lable
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupViews() {
        backgroundColor = .white
        contentView.addSubview(stack)
        stack.addArrangedSubview(albumsImage)
        stack.addArrangedSubview(albumsTitle)
        stack.addArrangedSubview(filesCountInAlbum)
    }
    
    func configureCell(imageName: String, title: String, filesCount: String) {
        albumsImage.image = UIImage(named: imageName)
        albumsTitle.text = title
        filesCountInAlbum.text = filesCount
    }
    
    private func setupLayout() {
        stack.snp.makeConstraints{
            $0.top.left.bottom.right.equalTo(contentView)
            $0.width.equalTo(170)
            $0.height.equalTo(300)
        }
    }
}
