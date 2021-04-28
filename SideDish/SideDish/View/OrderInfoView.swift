//
//  OrderInfoView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/28.
//

import UIKit

//@IBDesignable
class OrderInfoView: UIView {

    var amountLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        label.text = "수량"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        return label
    }()
    private var amountStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    private var innerStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        stack.widthAnchor.constraint(equalToConstant: 90).isActive = true
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
        
        self.addSubview(amountStack)
        self.amountStack.translatesAutoresizingMaskIntoConstraints = false
        amountStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        amountStack.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor).isActive = true
        amountStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        amountStack.heightAnchor.constraint(equalToConstant: 89).isActive = true
    }
    
}
