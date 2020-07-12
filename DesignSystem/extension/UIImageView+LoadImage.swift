//
//  UIImageView+LoadImage.swift
//  DesignSystem
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

// Code in this extension made from https://riptutorial.com/ios/example/29268/alamofireimage
extension UIImageView {
    
    func loadImage(from url: String) {
//        if let image = ImageCache.image(wihtIdentifier: url) {
//            self.image = image.af.imageAspectScaled(toFit: self.bounds.size)
//            return
//        }
        
        AF.request(url).responseImage {
            [weak self = self]
            response in
            if let data = response.data {
                guard let image = UIImage(data: data) else {
                    print("Error retrieving image")
                    return
                }
                
                ImageCache.add(image: image, withIdentifier: url)
                self?.image = image.af.imageAspectScaled(toFit: self?.bounds.size ?? CGSize(width: 1, height: 1))
            }
        }
    }
    
}
