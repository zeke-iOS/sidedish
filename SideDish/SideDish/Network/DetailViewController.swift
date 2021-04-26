//
//  DetailViewController.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/23.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var thumbnailImages: UIScrollView!
    
    var card: Card?
    var detailManager: CardDetailManager = CardDetailManager()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let card = card else { return }
        bind(id: card.id)
    }
    
    func bind(id: String) {
        detailManager.fetchDetail(id: id)
        detailManager.$cardDetail
            .receive(on: DispatchQueue.main)
            .sink { [weak self] string in
                self?.testLabel.text = string?.productDesciption
            }.store(in: &cancellables)
    }
}
