//
//  UIView+Margin.swift
//  Swift News
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

extension UIView {
    
    func margin(top: Spacing = .NONE, right: Spacing = .NONE, bottom: Spacing = .NONE, left: Spacing = .NONE) {
        self.layoutMargins = UIEdgeInsets(top: top.rawValue, left: left.rawValue, bottom: bottom
            .rawValue, right: right.rawValue)
    }
    
}
