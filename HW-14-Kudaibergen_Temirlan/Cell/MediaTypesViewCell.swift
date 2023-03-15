//
//  MediaTypesViewCell.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit
import SnapKit

class MediaTypesViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "MediaTypesViewCell"
    
    // MARK: UI
   
    private let albumsImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let albumsTitle: UILabel = {
       let lable = UILabel()
        lable.text = "Мои альбомы"
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textColor = .black
        return lable
    }()
    
    private let filesCountInAlbum: UILabel = {
       let lable = UILabel()
        lable.text = ""
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textColor = .black
        return lable
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
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
        albumsImage.image = UIImage(systemName: imageName)
        albumsTitle.text = title
        filesCountInAlbum.text = filesCount
    }
    
    private func setupLayout() {
        stack.snp.makeConstraints{
            $0.size.equalTo(contentView)
        }
        }
    }

