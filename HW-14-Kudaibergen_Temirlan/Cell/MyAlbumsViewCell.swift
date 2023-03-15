//
//  MyAlbumsViewCell.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit

final class MyAlbumsViewCell: UICollectionViewCell {
    private let albumsImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(albumsImage)
    }
    
    private func configureCell(imageName: String) {
        albumsImage.image = UIImage(named: imageName)
    }
    
    private func setupLayout() {
        albumsImage.snp.makeConstraints{
            
        }
    }
}
