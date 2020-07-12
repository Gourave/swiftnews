//
//  ImageCache.swift
//  DesignSystem
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import AlamofireImage

class ImageCache {
    
    fileprivate static let cache = AutoPurgingImageCache( memoryCapacity: 111_111_111, preferredMemoryUsageAfterPurge: 90_000_000)
    
    static func add(image: Image, withIdentifier identifier: String) {
        cache.add(image, withIdentifier: identifier)
    }
    
    static func image(wihtIdentifier identifier: String) -> Image? {
        return cache.image(withIdentifier: identifier)
    }
    
}
