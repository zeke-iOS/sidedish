//
//  OrderInfoView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/28.
//

import UIKit

//@IBDesignable
class DeliveryInfoView: UIView {

    private var mainStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    var pointLabel : UILabel = {
        let label = UILabel()
        label.text = "적립금"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()
    var point : UILabel = {
        let label = UILabel()
        label.text = "52원"
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        return label
    }()
    var addressLabel : UILabel = {
        let label = UILabel()
        label.text = "배송지"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()
    var address : UILabel = {
        let label = UILabel()
        label.text = "서울 경기 새벽배송 / 전국택배 (제주 및 도서산간 불가) [월 · 화 · 수 · 목 · 금 · 토] 수령 가능한 상품입니다"
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    var deliveryFeeLabel : UILabel = {
        let label = UILabel()
        label.text = "배송비"
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()
    var deliveryFee : UILabel = {
        let label = UILabel()
        label.text = "2,500원 (40,000원 이상 구매 시 무료)"
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        return label
    }()
    private var pointStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    private var addressStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    private var deliveryFeeStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
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
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).set()
        
        path.move(to: CGPoint(x: 0,y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.close()
        path.stroke()
        
        path.move(to: CGPoint(x: 0,y: self.frame.height))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.close()
        path.stroke()
    }
    private func configureView(){
        configureMainStackView()
        
        pointStack.addArrangedSubview(pointLabel)
        pointStack.addArrangedSubview(point)
        mainStack.addArrangedSubview(pointStack)
        
        addressStack.addArrangedSubview(addressLabel)
        addressStack.addArrangedSubview(address)
        mainStack.addArrangedSubview(addressStack)
        
        addressStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        deliveryFeeStack.addArrangedSubview(deliveryFeeLabel)
        deliveryFeeStack.addArrangedSubview(deliveryFee)
        mainStack.addArrangedSubview(deliveryFeeStack)
    }
    private func configureMainStackView(){
        self.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        mainStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: 24).isActive = true
    }
    
}
