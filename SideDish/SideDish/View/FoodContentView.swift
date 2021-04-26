//
//  FoodContentView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/26.
//

import UIKit

@IBDesignable
class FoodContentView: UIView {
    var stack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    var title : UILabel = {
        let label = UILabel()
        label.text = "음식 이름"
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    var detail : UILabel = {
        let label = UILabel()
        label.text = "아무거나 먹어"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        return label
    }()
    var discountPrice : UILabel = {
        let label = UILabel()
        label.text = "6000원"
        label.textColor = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        return label
    }()
    var originalPrice : UILabel = {
        let label = UILabel()
        label.text = "7000"
        label.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        return label
    }()
    var priceStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    var badgeStack = BadgeStack()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    func configureMainStackView(){
        self.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    func configureView(){
        configureMainStackView()
        
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(detail)
        priceStack.addArrangedSubview(discountPrice)
        priceStack.addArrangedSubview(originalPrice)
        stack.addArrangedSubview(priceStack)
        stack.addArrangedSubview(badgeStack)
    }
    func setText(with card : Card?){
        guard let card = card else { return }
        
        self.title.text = card.title
        self.detail.text = card.detail
        self.discountPrice.text = card.discountPrice?.description
        self.originalPrice.attributedText = NSMutableAttributedString(
            string: card.originalPrice?.description ?? "",
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        
        guard let badges = card.badge else {
            badgeStack.isHidden = true
            return
        }
        self.badgeStack.addBadges(with: badges)
    }
}
