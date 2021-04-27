//
//  PointDeliveryInfoView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/27.
//

import UIKit

@IBDesignable
class PointDeliveryInfoView: UIView {

    private var mainStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    private var innerStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    var delivery : ContentLabel = {
        let label = ContentLabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    var point : ContentLabel = {
        let label = ContentLabel()
        return label
    }()
    var deliveryFee : ContentLabel = {
        let label = ContentLabel()
        return label
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
        configureMainStackView()

    
    }
    private func configureMainStackView(){
        self.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        mainStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
