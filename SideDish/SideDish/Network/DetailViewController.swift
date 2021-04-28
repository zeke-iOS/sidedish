//
//  DetailViewController.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/23.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    
    @IBOutlet weak var foodInformation: UIScrollView!
    @IBOutlet weak var thumbnailImages: UIScrollView!
    @IBOutlet weak var foodImages: UIStackView!
    
    var card: Card?
    var detailManager: CardDetailManager = CardDetailManager()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        guard let card = card else { return }
        bind(card: card)
    }
    
    func bind(card: Card) {
        detailManager.fetchDetail(id: card.id)
        detailManager.$cardDetail
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cardDetail in
                self?.fetchThumbnailImages(string: cardDetail?.thumbImage ?? [])
                self?.fetchFoodImages(string: cardDetail?.detailSection ?? [])
            }.store(in: &cancellables)
    }
    
    func fetchThumbnailImages(string: [String]) {
        string.enumerated().forEach { (index, string) in
            let url = URL(string: string)
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(index)
            imageView.frame = CGRect(x: xPos, y: 0, width: thumbnailImages.bounds.width, height: thumbnailImages.bounds.height)
            imageView.load(url: url) {}
            thumbnailImages.addSubview(imageView)
            thumbnailImages.contentSize.width = imageView.frame.width * CGFloat(index+1)
        }
    }
    
    func fetchFoodImages(string: [String]) {
        string.enumerated().forEach{ (index, string) in
            let url = URL(string: string)
            let imageView = UIImageView()
            
            imageView.load(url: url){}
            
            imageView.contentMode = .scaleAspectFit
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
            self.foodImages.addArrangedSubview(imageView)
            foodInformation.contentSize.height = thumbnailImages.frame.height + (imageView.frame.width * CGFloat(index+1))
            
        }
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = card?.title
    }
}
