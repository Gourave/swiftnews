//
//  UIView+Padding.swift
//  DesignSystem
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

extension UIView {
    
    func setPadding(_ padding: Padding) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: self.topAnchor, constant: padding.top.rawValue).isActive = true
        self.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding.left.rawValue).isActive = true
        self.rightAnchor.constraint(equalTo: self.rightAnchor, constant: padding.right.rawValue).isActive = true
        self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: padding.bottom.rawValue).isActive = true
    }
    
}
