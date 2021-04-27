//
//  DetailViewController.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/23.
//

import UIKit
import Combine

class DetailViewController: UIViewController {

    @IBOutlet weak var thumbnailImages: UIScrollView!
    @IBOutlet weak var foodContentView: FoodContentView!
    
    var card: Card?
    var detailManager: CardDetailManager = CardDetailManager()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let card = card else { return }
        bind(card: card)
    }
    
    func bind(card: Card) {
        detailManager.fetchDetail(id: card.id)
        detailManager.$cardDetail
            .receive(on: DispatchQueue.main)
            .sink { [weak self] detail in
                self?.foodContentView.title.text = card.title
                self?.foodContentView.detail.text = detail?.productDesciption
                self?.foodContentView.originalPrice.text = detail?.prices[1]
                self?.foodContentView.discountPrice.text = detail?.prices[0]
            }.store(in: &cancellables)
    }
}
