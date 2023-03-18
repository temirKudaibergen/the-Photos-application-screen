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
    
     let headerLable: UILabel = {
        let lable = UILabel()
         lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return lable
    }()
    
    //    MARK: Lifecyle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        swtupViews()
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headerLable.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: Setup
    
    func configureHeader(categoryName: String) {
        headerLable.text = categoryName
    }
    
    private func swtupViews() {
        addSubview(headerLable)
    }
    
    private func setupLayout() {
        headerLable.snp.makeConstraints{
            $0.bottom.equalTo(self)
            $0.left.equalTo(self)
        }
    }
}
