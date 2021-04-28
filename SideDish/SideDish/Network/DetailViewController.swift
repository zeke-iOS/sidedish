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
                self?.foodContentView.setText(with: card)
                self?.foodContentView.setBadge(with: card.badge)
            }.store(in: &cancellables)
    }
}
