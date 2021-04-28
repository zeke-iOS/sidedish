//
//  OrderInfoView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/28.
//

import UIKit

//@IBDesignable
class OrderInfoView: UIView {

    var total : UILabel = {
        let label = UILabel()
        label.text = "5,200원"
        label.textAlignment = .right
        label.textColor = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 32)
        return label
    }()
    var amount : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 23))
        label.text = "1"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        return label
    }()
    private var mainStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    private var amountStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.heightAnchor.constraint(equalToConstant: 89).isActive = true
        return stack
    }()
    private var amountInnerStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        return stack
    }()
    private var totalStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 24
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.heightAnchor.constraint(equalToConstant: 94).isActive = true
        return stack
    }()
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).set()

        path.move(to: CGPoint(x: 0,y: 89))
        path.addLine(to: CGPoint(x: self.frame.width, y: 89))
        path.close()
        path.stroke()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    func configureView(){

        amountStack.addArrangedSubview(OrderInfoComponent.amountLabel)
        amountStack.addArrangedSubview(amountInnerStack)
        
        amountInnerStack.addArrangedSubview(amount)
        amountInnerStack.addArrangedSubview(OrderInfoComponent().innerButtonStack)
        
        totalStack.addArrangedSubview(OrderInfoComponent.totalLabel)
        totalStack.addArrangedSubview(total)
        
        mainStack.addArrangedSubview(amountStack)
        mainStack.addArrangedSubview(totalStack)
        mainStack.addArrangedSubview(OrderInfoComponent.orderButton)
        
        self.addSubview(mainStack)
        
        self.mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStack.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
}
