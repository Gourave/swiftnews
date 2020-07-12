//
//  ArticleFeedViewDelegate.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

protocol ArticleFeedViewDelegate : AnyObject {
    
    func updateFeed(articles : [Article])
    
    func showAlert(errorMessage: String)
    
}
