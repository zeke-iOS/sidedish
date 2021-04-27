//
//  FoodContentView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/26.
//

import UIKit

@IBDesignable
class FoodContentView: UIView {

    private var mainStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        stack.distribution = .fillEqually
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
        label.text = "맛있는거 먹쟈"
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
    private var priceStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    private var eventBadge : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = "이벤트특가"
        label.layer.cornerRadius = 5
        label.layer.backgroundColor = #colorLiteral(red: 0.5095996261, green: 0.8290402293, blue: 0.1742436588, alpha: 1)
        
        label.widthAnchor.constraint(equalToConstant: 72).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        label.isHidden = true
        return label
    }()
    
    private var lunchingBadge : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textAlignment = .center
        label.text = "론칭특가"
        label.layer.cornerRadius = 5
        label.layer.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        label.widthAnchor.constraint(equalToConstant: 61).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        label.isHidden = true
        return label
    }()
    
    private var badgeStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    func setText(with card : Card?){
        guard let card = card else { return }
        
        self.title.text = card.title
        self.detail.text = card.detail
        self.discountPrice.text = card.discountPrice?.description
        self.originalPrice.attributedText = NSMutableAttributedString(
            string: card.originalPrice?.description ?? "",
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        
        if card.badge == nil {
            badgeStack.isHidden = true
        }
        card.badge?.forEach{ badge in
            switch badge {
            case "이벤트특가":
                self.eventBadge.isHidden = false
            case "론칭특가":
                self.lunchingBadge.isHidden = false
            default:
                break
            }
        }
        
//        guard let badges = card.badge else {
//            badgeStack.isHidden = true
//            return
//        }
//        badgeStack.isHidden = false
//        setBadge(with : badges)
    }
    private func setBadge(with badges : [String]) {
//        self.badgeStack.removeAllArrangedSubviews()
        badges.forEach{ name in
            switch name {
            case "이벤트특가" : self.badgeStack.addArrangedSubview(BadgeLabel.eventBadge)
            case "론칭특가" : self.badgeStack.addArrangedSubview(BadgeLabel.lunchingBadge)
            default : break
            }
        }
    }
    private func configureMainStackView(){
        self.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        mainStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    private func configureView(){
        configureMainStackView()
        
        mainStack.addArrangedSubview(title)
        mainStack.addArrangedSubview(detail)
        priceStack.addArrangedSubview(discountPrice)
        priceStack.addArrangedSubview(originalPrice)
        mainStack.addArrangedSubview(priceStack)
        badgeStack.addArrangedSubview(eventBadge)
        badgeStack.addArrangedSubview(lunchingBadge)
        mainStack.addArrangedSubview(badgeStack)
    }
}
