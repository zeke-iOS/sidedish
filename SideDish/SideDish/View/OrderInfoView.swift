//
//  OrderInfoView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/28.
//

import UIKit

//@IBDesignable
class OrderInfoView: UIView {

    private var amountLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        label.text = "수량"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        return label
    }()
    private var totalLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        label.text = "총 주문금액"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 18)
        return label
    }()
    var total : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        label.text = "5,200원"
        label.textColor = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 32)
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
    private var innerStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        stack.widthAnchor.constraint(equalToConstant: 90).isActive = true
        return stack
    }()
    private var totalStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 24
        stack.alignment = .center
        stack.distribution = .fill
        stack.heightAnchor.constraint(equalToConstant: 94).isActive = true
        return stack
    }()
    private var buttonStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        return stack
    }()
    var amount : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 23))
        label.text = "1"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        return label
    }()
    private var up : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.setTitle("∧", for: .normal)
        return button
    }()
    private var down : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.setTitle("∨", for: .normal)
        return button
    }()
    private var orderButton : UIButton = {
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

        amountStack.addArrangedSubview(amountLabel)
        amountStack.addArrangedSubview(innerStack)
        
        innerStack.addArrangedSubview(amount)
        innerStack.addArrangedSubview(buttonStack)
        
        buttonStack.addArrangedSubview(up)
        buttonStack.addArrangedSubview(down)
        
        totalStack.addArrangedSubview(totalLabel)
        totalStack.addArrangedSubview(total)
        
        mainStack.addArrangedSubview(amountStack)
        mainStack.addArrangedSubview(totalStack)
        mainStack.addArrangedSubview(orderButton)
        
        self.addSubview(mainStack)
        
        self.mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStack.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
}
