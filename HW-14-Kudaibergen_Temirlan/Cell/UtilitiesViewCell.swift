//
//  UtilitiesViewCell.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit
import SnapKit

class UtilitiesViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "UtilitiesViewCell"
    
    // MARK: UI
   
    private let albumsImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let albumsTitle: UILabel = {
        let lable = UILabel()
        lable.textColor = .systemBlue
        lable.font = .systemFont(ofSize: 20)
        return lable
    }()
    
    private let filesCountInAlbum: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.textColor = .lightGray
        return lable
    }()
    
    // MARK: Initializers
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupViews()
        setupLayout()
    }
    
    override func prepareForReuse() {
        self.albumsImage.image = nil
        self.albumsTitle.text = nil
        self.filesCountInAlbum.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupViews() {
        backgroundColor = .white
        contentView.addSubview(albumsImage)
        contentView.addSubview(albumsTitle)
        contentView.addSubview(filesCountInAlbum)
    }
    
    func configureCell(imageName: String, title: String, filesCount: String) {
        albumsImage.image = UIImage(systemName: imageName)
        albumsTitle.text = title
        filesCountInAlbum.text = filesCount
    }
    
    private func setupLayout() {
        albumsImage.snp.makeConstraints{
            $0.width.equalTo(29)
            $0.height.equalTo(28)
        }
        albumsTitle.snp.makeConstraints{
            $0.left.equalTo(albumsImage.snp.right).offset(20)
        }
        filesCountInAlbum.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-15)
        }
    }
}
