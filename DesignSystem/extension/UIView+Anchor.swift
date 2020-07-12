//
//  UIView+Anchor.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

extension UIView {
    
    // Idea from https://github.com/bhlvoong/LBTAComponents/blob/master/LBTAComponents/Classes/UIView%2BAnchors.swift
    func anchor(top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                padding: Padding = Padding(),
                width: CGFloat = 0,
                height: CGFloat = 0,
                enableInsets: Bool = false) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets
            topInset = insets?.top ?? 0
            bottomInset = insets?.bottom ?? 0
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top.rawValue + topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: padding.left.rawValue).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -padding.right.rawValue).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom.rawValue - bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
}
