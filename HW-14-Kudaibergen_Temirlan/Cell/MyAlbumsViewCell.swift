//
//  MyAlbumsViewCell.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit

final class MyAlbumsViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "MyAlbumsViewCell"
    
    // MARK: UI
    
    private let albumsImageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let albumsTitleLable: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private let filesCountInAlbumLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .lightGray
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
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupViews() {
        backgroundColor = .white
        clipsToBounds = true
        contentView.addSubview(stack)
        stack.addArrangedSubview(albumsImageImageView)
        stack.addArrangedSubview(albumsTitleLable)
        stack.addArrangedSubview(filesCountInAlbumLable)
    }
    
    public func configureCell(imageName: String, title: String, filesCount: String) {
        albumsImageImageView.image = UIImage(named: imageName)
        albumsTitleLable.text = title
        filesCountInAlbumLable.text = filesCount
    }
    
    private func setupLayout() {
        stack.snp.makeConstraints{
            $0.edges.equalTo(contentView)
            $0.width.equalTo(170)
            $0.height.equalTo(300)
        }
    }
}
