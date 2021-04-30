//
//  Detail.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/23.
//

import Foundation

class CardDetail: Hashable {
    let topImage: String
    let thumbImage: [String]
    let productDesciption: String
    let point: String
    let deliveryInfo: String
    let deliveryFee: String
    let prices: [String]
    let detailSection: [String]
    
    init(topImage: String, thumbImage: [String], productDesciption: String, point: String, deliveryInfo: String, deliveryFee: String, prices: [String], detailSection: [String]) {
        self.topImage = topImage
        self.thumbImage = thumbImage
        self.productDesciption = productDesciption
        self.point = point
        self.deliveryInfo = deliveryInfo
        self.deliveryFee = deliveryFee
        self.prices = prices
        self.detailSection = detailSection
    }
    static func == (lhs: CardDetail, rhs: CardDetail) -> Bool {
        return lhs.topImage == rhs.topImage
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(topImage)
    }
}
