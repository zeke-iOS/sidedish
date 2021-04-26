//
//  FoodContentView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/26.
//

import UIKit

class FoodContentView: UIView {
    var stack : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    var title : UILabel = {
        let label = UILabel()
        label.text = "title"
        return label
    }()
    var detail : UILabel = {
        let label = UILabel()
        label.text = "detail"
        return label
    }()
    var discountPrice : UILabel = {
        let label = UILabel()
        label.text = "discount"
        return label
    }()
    var originalPrice : UILabel = {
        let label = UILabel()
        label.text = "original"
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
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        self.stack.addArrangedSubview(title)
        self.stack.addArrangedSubview(detail)
        self.stack.addArrangedSubview(discountPrice)
        self.stack.addArrangedSubview(originalPrice)
        self.stack.addArrangedSubview(badgeView)
    }
}
