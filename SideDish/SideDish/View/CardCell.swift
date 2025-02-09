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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var foodContent: FoodContentView!
    var card : Card? {
        didSet {
            thumbnail.load(url: card?.imageURL, completion: {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            })
            foodContent.setText(with: card)
            foodContent.setBadge(with: card?.badge)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.activityIndicator.startAnimating()
        configureThumbnail()
    }
    func configureThumbnail(){
        self.thumbnail.layer.cornerRadius = 5
    }
}
