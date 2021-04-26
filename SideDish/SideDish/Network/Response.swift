//
//  Response.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/20.
//

import Foundation

struct FoodItem : Codable {
    let id : String
    let image : String
    let alt : String
    let delivery : [String]?
    let title : String
    let description : String
    let originalPrice : String?
    let discountPrice : String?
    let badge : [String]?
    
    enum CodingKeys : String, CodingKey {
        case id = "detail_hash"
        case image
        case alt
        case delivery = "delivery_type"
        case title
        case description
        case originalPrice = "n_price"
        case discountPrice = "s_price"
        case badge
     }
}

struct CardsResponse : Codable {
    let statusCode : Int
    let body : [FoodItem]
    
    func getCards() -> [Card] {
        var cards = [Card]()
        for item in self.body {
            let card = responseToCard(response: item)
            cards.append(card)
        }
        return cards
    }
    private func responseToCard(response item : FoodItem) -> Card {
        let card = Card(id: item.id,
                        title: item.title,
                        detail: item.description,
                        d_price: item.discountPrice,
                        o_price: item.originalPrice,
                        url: URL(string: item.image),
                        badge: item.badge)
        return card
    }
}

struct DetailResponse: Codable {
    let id: String
    let data: DetailImages
    
    enum CodingKeys: String, CodingKey {
        case id = "hash"
        case data
    }

    func responseToCardDetail() -> CardDetail {
        let cardDetail = CardDetail(topImage: data.topImage, thumbImage: data.thumbImages, productDesciption: data.productDescription, point: data.point, deliveryInfo: data.deliveryInfo, deliveryFee: data.deliveryFee, prices: data.prices, detailSection: data.detailSection)
        return cardDetail
    }
    
}

struct DetailImages: Codable {
    let topImage: String
    let thumbImages: [String]
    let productDescription: String
    let point: String
    let deliveryInfo: String
    let deliveryFee: String
    let prices: [String]
    let detailSection: [String]
    
    enum CodingKeys: String, CodingKey {
        case topImage = "top_image"
        case thumbImages = "thumb_images"
        case productDescription = "product_description"
        case point
        case deliveryInfo = "delivery_info"
        case deliveryFee = "delivery_fee"
        case prices
        case detailSection = "detail_section"
    }
}
