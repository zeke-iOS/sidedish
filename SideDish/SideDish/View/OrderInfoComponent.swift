//
//  OrderInfoComponent.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/28.
//

import UIKit

struct OrderInfoComponent {
//    static var up : UIButton = {
//        let button = UIButton()
//        button.layer.borderWidth = 0.5
//        button.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
//        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
//        button.setTitle("∧", for: .normal)
//        return button
//    }()
//    static var down : UIButton = {
//        let button = UIButton()
//        button.layer.borderWidth = 0.5
//        button.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
//        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
//        button.setTitle("∨", for: .normal)
//        return button
//    }()
    static var amountLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        label.text = "수량"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        return label
    }()
    static var totalLabel : UILabel = {
        let label = UILabel()
        label.text = "총 주문금액"
        label.textAlignment = .right
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 18)
        return label
    }()
    static var orderButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5095996261, green: 0.8290402293, blue: 0.1742436588, alpha: 1)
        button.setTitle("주문하기", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 18)
        button.layer.cornerRadius = 8
        button.heightAnchor.constraint(equalToConstant: 58).isActive = true
        return button
    }()
//    var innerButtonStack : UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.alignment = .fill
//        stack.distribution = .fillEqually
//        stack.layer.borderWidth = 1
//        stack.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
//        stack.addArrangedSubview(OrderInfoComponent.up)
//        stack.addArrangedSubview(OrderInfoComponent.down)
//        return stack
//    }()
}
