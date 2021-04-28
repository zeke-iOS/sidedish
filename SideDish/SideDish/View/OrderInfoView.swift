//
//  OrderInfoView.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/28.
//

import UIKit

@IBDesignable
class OrderInfoView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).set()
    
        path.move(to: CGPoint(x: 0,y: self.frame.height))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.close()
        path.stroke()
    }

}
