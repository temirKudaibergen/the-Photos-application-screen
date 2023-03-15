//
//  HeaderSupplementaryView.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    // MARK: Properties
    
    static let identifier = "HeaderSupplementaryView"
    
    //     MARK: UI
    
    private let headerLable: UILabel = {
        let lable = UILabel()
        lable.text = "header"
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        return lable
    }()
    
    //    MARK: Lifecyle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(headerLable)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: Setup
    
    func configureHeader(categoryName: String) {
        headerLable.text = categoryName
    }
    
    private func setupLayout() {
        headerLable.snp.makeConstraints{
            $0.centerY.equalTo(center)
        }
    }
}
