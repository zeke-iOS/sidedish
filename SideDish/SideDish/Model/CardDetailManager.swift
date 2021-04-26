//
//  CardDetailManager.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/23.
//

import Foundation
import Combine

class CardDetailManager {
    @Published var cardDetail: CardDetail? = nil
    private var cancellables = Set<AnyCancellable>()

    
    func fetchDetail(id: String) {
        DetailAPI.loadDetail(id: id)
            .sink(receiveCompletion: { _ in },
                  receiveValue: {self.cardDetail = $0.responseToCardDetail()})
            .store(in: &cancellables)
    }
}
