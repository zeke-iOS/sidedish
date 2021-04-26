//
//  Badge.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/26.
//
import UIKit

enum BadgeType : String, CodingKey, CaseIterable {
    case eventBadge = "이벤트특가"
    case lunchingBadge = "론칭특가"
    
    var text : String { self.stringValue }
}

struct Badge {
    
    static let eventBadge : () -> UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 25))
        
        view.layer.backgroundColor = #colorLiteral(red: 0.5095996261, green: 0.8290402293, blue: 0.1742436588, alpha: 1)
        view.layer.cornerRadius = 5
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 56, height: 17))
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = "이벤트특가"
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        
        return view
    }
    static let lunchingBadge : () -> UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 61, height: 25))
        
        view.layer.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        view.layer.cornerRadius = 5
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: 17))
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = "론칭특가"
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        
        return view
    }
    static func getViews(with badges : [String]) -> [UIView] {
        
        var views = [UIView]()
        badges.forEach{ name in
            let type = BadgeType.init(rawValue: name)
            
            var view = UIView()
            switch type {
            case .eventBadge: view = Badge.eventBadge()
            case .lunchingBadge: view = Badge.lunchingBadge()
            default : break
            }
            views.append(view)
        }
        return views
    }
}

