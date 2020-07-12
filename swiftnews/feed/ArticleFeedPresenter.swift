//
//  ArticleFeedPresenter.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import Foundation

class ArticleFeedPresenter {
    
    fileprivate weak var viewDelegate : ArticleFeedViewDelegate?
    
    fileprivate let api = Api.instance()
    
    init() {
    }
    
    func attach(_ viewDelegate: ArticleFeedViewDelegate) {
        self.viewDelegate = viewDelegate
        fetchArticles()
    }
    
    func detach() {
        // Perform any needed clean up
    }
    
    fileprivate func fetchArticles() {
        api.fetchArticles {
            [weak self = self]
            result in
            switch result {
            case .success(let articles):
                self?.viewDelegate?.updateFeed(articles: articles)
            case .failure(let error):
                self?.viewDelegate?.showAlert(errorMessage: error.errorMessage)
            }
        }
    }
    
}
