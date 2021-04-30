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
    @IBOutlet weak var foodContent: DetailFoodContentView!
    @IBOutlet weak var deliveryInfo: DeliveryInfoView!
    @IBOutlet weak var foodImages: UIStackView!
    @IBOutlet weak var orderInfo: OrderInfoView!
    
    var card: Card?
    var detailManager: CardDetailManager = CardDetailManager()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        orderInfo.up.addTarget(self, action: #selector(increase), for: .touchUpInside)
        orderInfo.down.addTarget(self, action: #selector(reduce), for: .touchUpInside)
        orderInfo.orderButton.addTarget(self, action: #selector(order), for: .touchUpInside)
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
            
            imageView.load(url: url){
                guard let image = imageView.image else { return }
                let ratio = image.size.height / image.size.width
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: ratio).isActive = true
            }

            imageView.contentMode = .scaleAspectFit
            
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
    func increase() {
        let totalPrice = card?.discountPrice?.filter{ $0.isNumber }
        orderInfo.amount.text = "\(Int(orderInfo.amount.text!)! + 1)"
        let price = Int32(totalPrice!)! * Int32(orderInfo.amount.text!)!
        let decimalTotalPrice = addDecimal(value: price)
        orderInfo.total.text = decimalTotalPrice
        
    }
    
    @objc
    func reduce() {
        let totalPrice = card?.discountPrice?.filter{ $0.isNumber }
        if Int(orderInfo.amount.text!)! == 1 {
            return
        } else {
            orderInfo.amount.text = "\(Int(orderInfo.amount.text!)! - 1)"
            let price = Int32(totalPrice!)! * Int32(orderInfo.amount.text!)!
            let decimalTotalPrice = addDecimal(value: price)
            orderInfo.total.text = decimalTotalPrice
        }
    }
    
    @objc
    func order() {
        let alert = UIAlertController(title: "주문 완료", message: "주문이 성공적으로 완료되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func addDecimal(value: Int32) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
        return result
    }
}
