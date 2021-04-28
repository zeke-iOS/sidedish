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
    @IBOutlet weak var foodContent: FoodContentView!
    @IBOutlet weak var deliveryInfo: DeliveryInfoView!
    @IBOutlet weak var foodImages: UIStackView!
    @IBOutlet weak var orderInfo: OrderInfoView!
    
    var card: Card?
    var detailManager: CardDetailManager = CardDetailManager()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        orderInfo.up.addTarget(self, action: #selector(onTapButtonWithUp), for: .touchUpInside)
        orderInfo.down.addTarget(self, action: #selector(onTapButtonWithDown), for: .touchUpInside)
        guard let card = card else { return }
        bind(card: card)
    }
    
    func bind(card: Card) {
        detailManager.fetchDetail(id: card.id)
        detailManager.$cardDetail
            .receive(on: DispatchQueue.main)
            .sink { [weak self] detail in
                self?.fetchThumbnailImages(string: detail?.thumbImage ?? [])
                self?.fetchFoodImages(string: detail?.detailSection ?? [])
                self?.foodContent.setText(with: card)
                self?.foodContent.setBadge(with: card.badge)
                self?.bindFoodContent(with: detail)
                self?.orderInfo.total.text = card.discountPrice
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
        }
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = card?.title
    }
    
    func bindFoodContent(with detail: Published<CardDetail?>.Publisher.Output) {
        self.deliveryInfo.point.text = detail?.point
        self.deliveryInfo.address.text = detail?.deliveryInfo
        self.deliveryInfo.deliveryFee.text = detail?.deliveryFee
    }
    
    @objc
    func onTapButtonWithUp() {
        let totalPrice = card?.discountPrice?.filter{ $0.isNumber }
        orderInfo.amount.text = "\(Int(orderInfo.amount.text!)! + 1)"
        orderInfo.total.text = "\(Int(totalPrice!)! * Int(orderInfo.amount.text!)!)원"
    }
    
    @objc
    func onTapButtonWithDown() {
        let totalPrice = card?.discountPrice?.filter{ $0.isNumber }
        if Int(orderInfo.amount.text!)! == 0 {
            return
        } else {
            orderInfo.amount.text = "\(Int(orderInfo.amount.text!)! - 1)"
            orderInfo.total.text = "\(Int(totalPrice!)! * Int(orderInfo.amount.text!)!)원"
        }
        
    }
}
