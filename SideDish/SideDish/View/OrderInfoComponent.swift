//
//  OrderInfoComponent.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/28.
//

import UIKit

struct OrderInfoComponent {
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
}
