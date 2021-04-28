//
//  BadgeView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/26.
//

import UIKit

struct BedgeCase {
    static let eventBadge : (String) -> UIView = { name in
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 25))
        
        view.layer.backgroundColor = #colorLiteral(red: 0.5095996261, green: 0.8290402293, blue: 0.1742436588, alpha: 1)
        view.layer.cornerRadius = 5
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 56, height: 17))
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = name
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 56).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        
        return view
    }
    static let lunchingBadge : (String) -> UIView = { name in
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 61, height: 25))
        
        view.layer.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        view.layer.cornerRadius = 5
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: 17))
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = name
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 45).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        
        return view
    }
}
class BadgeStack: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.spacing = 4
        self.alignment = .leading
        self.distribution = .fillProportionally
    }
    func makeBadge(with badges : [String]){
        badges.forEach{ [weak self] name in
            let view = BedgeCase.eventBadge(name)
            self?.addArrangedSubview(view)
        }
    }
}
