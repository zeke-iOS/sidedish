//
//  ContentLabel.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/27.
//

import UIKit

class ContentLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    func configure(){
        self.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        self.font = UIFont(name: "NotoSansKR-Regular", size: 14)
    }
}
