//
//  API.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/20.
//

import Alamofire
import Foundation
import Combine

class CardAPI {

    static func loadDish(type : EndPoint) -> AnyPublisher<CardsResponse, APIError> {
        let request = AF.request(type.url, method: .get)
        return API().run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

class DetailAPI {
    static func loadDetail(id: String) -> AnyPublisher<DetailResponse, APIError> {
        let request = AF.request(EndPoint.detailURL(id: id)!, method: .get)
        return API().run(request).map(\.value).eraseToAnyPublisher()
    }
}

