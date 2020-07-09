//
//  Padding.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

struct Padding {
    fileprivate(set) var top: Spacing
    fileprivate(set) var right: Spacing
    fileprivate(set) var bottom: Spacing
    fileprivate(set) var left: Spacing
    
    init(top: Spacing = .NONE, right: Spacing = .NONE, bottom: Spacing = .NONE, left: Spacing = .NONE) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }
    
    init(vertical: Spacing = .NONE, horizontal: Spacing = .NONE) {
        self.top = vertical
        self.bottom = vertical
        self.right = horizontal
        self.left = horizontal
    }
    
}
