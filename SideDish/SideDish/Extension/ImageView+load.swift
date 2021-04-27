//
//  ImageView+load.swift
//  SideDish
//
//  Created by 박혜원 on 2021/04/20.
//

import UIKit

extension UIImageView {
    func load(url: URL?, completion : @escaping () -> ()) {
        guard let url = url else { return }
        DispatchQueue.global().async { [weak self] in
            let cacheKey = NSString(string: url.description)
            if let cacheImage = ImageCacheManager.shared.object(forKey: cacheKey) {
                DispatchQueue.main.async {
                    self?.image = cacheImage
                }
                return
            }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        ImageCacheManager.shared.setObject(image, forKey: url.description as NSString)
                        completion()
                    }
                }
            }
        }
    }
}
