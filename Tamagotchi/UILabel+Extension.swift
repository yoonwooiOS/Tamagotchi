//
//  UILabel+Extension.swift
//  Tamagotchi
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit

extension UILabel {
    
    func primaryUILabel(font: CGFloat) {
        
        self.font = .boldSystemFont(ofSize: font)
        self.textColor = UIColor.basicColor
        self.textAlignment = .center
        self.layer.borderWidth = 0.5
        self.layer.borderColor = CGColor.basicColor
        self.layer.cornerRadius = 4
    }
    
}
