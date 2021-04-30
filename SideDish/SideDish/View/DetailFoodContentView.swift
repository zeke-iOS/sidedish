//
//  DetailFoodContentView.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/30.
//

import UIKit

class DetailFoodContentView: FoodContentView {
    var detailTitle: UILabel?
    var detailDescription: UILabel?
    var detailDiscountPrice: UILabel?
    var detailOriginalPrice: UILabel?
    var detailPrice: UIStackView?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setOverrideLabel()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setOverrideLabel()
        configureView()
    }
    
    override func setText(with card: Card?) {
        guard let card = card else { return }
        guard let title = detailTitle, let description = detailDescription, let discountPrice = detailDiscountPrice, let originalPrice = detailOriginalPrice else { return }
        title.text = card.title
        description.text = card.detail
        discountPrice.text = card.discountPrice?.description
        originalPrice.attributedText = NSMutableAttributedString(
            string: card.originalPrice?.description ?? "",
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
    }
    
    func setOverrideLabel() {
        detailTitle = title
        detailDescription = detail
        detailDiscountPrice = discountPrice
        detailOriginalPrice = originalPrice
        detailPrice = priceStack
        
        detailTitle?.font = UIFont(name: "NotoSansKR-Bold", size: 24)
        detailDescription?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        detailDiscountPrice?.font = UIFont(name: "NotoSansKR-Bold", size: 24)
        detailOriginalPrice?.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        priceStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 4
            stack.alignment = .bottom
            stack.distribution = .fillProportionally
            return stack
        }()
    }
    
    override func configureView() {
        configureMainStackView()
        
        guard let title = detailTitle, let description = detailDescription, let discountPrice = detailDiscountPrice, let originalPrice = detailOriginalPrice else { return }
        
        mainStack.addArrangedSubview(title)
        mainStack.addArrangedSubview(description)
        priceStack.addArrangedSubview(discountPrice)
        priceStack.addArrangedSubview(originalPrice)
        mainStack.addArrangedSubview(priceStack)
    }
}
