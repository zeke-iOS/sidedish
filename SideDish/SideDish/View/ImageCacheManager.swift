//
//  ImageCacheManager.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/27.
//

import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
