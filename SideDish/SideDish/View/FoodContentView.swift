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
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    var title : UILabel = {
        let label = UILabel()
        label.text = "음식 이름"
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
    var badgeView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
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
    func configureView(){
        self.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.distribution = .fill
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        self.stack.addArrangedSubview(title)
        self.stack.addArrangedSubview(detail)
        
        let priceStack = UIStackView()
        priceStack.axis = .horizontal
        priceStack.spacing = 4
        priceStack.alignment = .fill
        priceStack.distribution = .fillProportionally
        priceStack.addArrangedSubview(discountPrice)
        priceStack.addArrangedSubview(originalPrice)
        
        self.stack.addArrangedSubview(priceStack)
        self.stack.addArrangedSubview(badgeView)
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
            badgeView.isHidden = true
            return
        }
        badges.forEach{ badge in
            let view = makeBadge(with: badge)
            self.badgeView.addArrangedSubview(view)
        }
    }
    func makeBadge(with name: String) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 25))
        
        view.backgroundColor = .white
        view.layer.backgroundColor = #colorLiteral(red: 0.5095996261, green: 0.8290402293, blue: 0.1742436588, alpha: 1)
        view.layer.cornerRadius = 5
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 56, height: 17))
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.text = name
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 56).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
     
        return view
    }
}
