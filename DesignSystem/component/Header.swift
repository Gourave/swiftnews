//
//  Header.swift
//  Swift News
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

class Header : UILabel {
    
    enum Style : CGFloat {
        case H1 = 36
        case H2 = 24
        case H3 = 20
    }
    
    var style: Style = .H1 {
        didSet {
            self.font = UIFont.boldSystemFont(ofSize: style.rawValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.boldSystemFont(ofSize: style.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
