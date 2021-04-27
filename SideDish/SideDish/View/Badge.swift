//
//  Badge.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/26.
//
import UIKit

struct BadgeLabel {
    static let eventBadge : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = "이벤트특가"
        label.layer.cornerRadius = 5
        label.layer.backgroundColor = #colorLiteral(red: 0.5095996261, green: 0.8290402293, blue: 0.1742436588, alpha: 1)
        
        label.widthAnchor.constraint(equalToConstant: 72).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }()
    static let lunchingBadge : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = "론칭특가"
        label.layer.cornerRadius = 5
        label.layer.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        label.widthAnchor.constraint(equalToConstant: 61).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }()
}
