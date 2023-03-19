//
//  MediaTypesViewCell.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit
import SnapKit

final class MediaTypesViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "MediaTypesViewCell"
    
    // MARK: UI
    
    private let albumsImageImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let albumsTitleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .systemBlue
        lable.font = .systemFont(ofSize: 20)
        return lable
    }()
    
    private let filesCountInAlbumLable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.textColor = .lightGray
        return lable
    }()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    override func prepareForReuse() {
        albumsImageImageView.image = nil
        albumsTitleLable.text = nil
        filesCountInAlbumLable.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupViews() {
        backgroundColor = .white
        contentView.addSubview(albumsImageImageView)
        contentView.addSubview(albumsTitleLable)
        contentView.addSubview(filesCountInAlbumLable)
    }
    
    func configureCell(imageName: String, title: String, filesCount: String) {
        albumsImageImageView.image = UIImage(systemName: imageName)
        albumsTitleLable.text = title
        filesCountInAlbumLable.text = filesCount
    }
    
    private func setupLayout() {
        albumsImageImageView.snp.makeConstraints{
            $0.width.equalTo(29)
            $0.height.equalTo(28)
        }
        albumsTitleLable.snp.makeConstraints{
            $0.left.equalTo(albumsImageImageView.snp.right).offset(20)
        }
        filesCountInAlbumLable.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-15)
        }
    }
}

