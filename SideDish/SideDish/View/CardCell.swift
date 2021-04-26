//
//  CardCell.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/19.
//

import UIKit
import Alamofire

class CardCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var badgeStack: UIStackView!
    
    var card : Card? {
        didSet {
            setCardData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.activityIndicator.startAnimating()
        configureTitle()
        configureDetail()
        configureThumbnail()
        configureBadgeStack()
    }
    func setCardData(){
        thumbnail.load(url: card?.imageURL, completion: {
            self.activityIndicator.stopAnimating()
        })
        title.text = card?.title
        detail.text = card?.detail
        discountPrice.text = card?.discountPrice?.description
        originalPrice.attributedText = NSMutableAttributedString(string: card?.originalPrice?.description ?? "",
                                                                      attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        guard let badges = card?.badge else {
            badgeStack.isHidden = true
            return
        }
        badges.forEach{ badge in
            let view = makeBadge(with: badge)
            self.badgeStack.addArrangedSubview(view)
        }
    }
    func makeBadge(with name: String) -> UIView {
        switch name {
        case "이벤트특가" : return BadgeView().eventBadge(name)
        case "론칭특가" : return BadgeView().lunchingBadge(name)
        default:
            return UIView()
        }
    }
    func configureTitle(){
        self.title.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        self.title.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        self.title.numberOfLines = 0
        self.title.lineBreakMode = .byWordWrapping
    }
    func configureDetail(){
        self.detail.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        self.detail.font = UIFont(name: "NotoSansKR-Regular", size: 14)
    }
    func configurePrice(){
        self.discountPrice.textColor = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1)
        self.discountPrice.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        
        self.originalPrice.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        self.originalPrice.font = UIFont(name: "NotoSansKR-Regular", size: 14)
    }
    func configureThumbnail(){
        self.thumbnail.layer.cornerRadius = 5
    }
    func configureBadgeStack(){
        self.badgeStack.translatesAutoresizingMaskIntoConstraints = false
        self.badgeStack.distribution = .fillProportionally
        self.badgeStack.alignment = .fill
    }
}
