//
//  CollectionViewCell.swift
//  Tamagotchi
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    let nameLabel: UILabel = {
        var name = UILabel()
        name.primaryUILabel(font: 12)
        name.layer.borderWidth = 0.5
        name.layer.borderColor = CGColor.basicColor
        name.layer.cornerRadius = 4
        return name
        
    }()
    let characterImageView: UIImageView = {
        
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 50
        return imageView
        
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUphierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUphierarchy() {
        
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
        
    }
    
    
    func setupLayout() {
        
        
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(12)
           
            make.centerX.equalTo(contentView)
            make.size.equalTo(88)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(8)
            make.centerX.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalTo(100)
            make.height.equalTo(24)
            }
            
    }
    
    func setupCell(name: String, imageName: String) {
        
       
        nameLabel.text = name
        characterImageView.image = UIImage(named: imageName)
        
    }
}
