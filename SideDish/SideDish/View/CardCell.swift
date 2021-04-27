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
            })
            foodContent.setText(with: card)
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
    
    override func prepareForReuse() {
        <#code#>
    }
}
