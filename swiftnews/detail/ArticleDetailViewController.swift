//
//  ArticleDetailViewController.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

class ArticleDetailViewController : UIViewController {
    
    var article : Article? = nil {
        didSet {
            title = article?.title
            titleLabel.text = article?.title
            body.text = article?.body
            if let thumbnailUrl = article?.thumbnail {
                thumbnail.loadImage(from: thumbnailUrl)
            }
        }
    }
    
    fileprivate let thumbnail = UIImageView()
    
    fileprivate let titleLabel : Header = {
        let header = Header()
        header.style = .H2
        header.numberOfLines = 0
        return header
    }()
    
    fileprivate let body : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = UIColor.white
        
        let scrollView = UIScrollView(frame: view.bounds)
        view.addSubview(scrollView)
        
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        let stackView = UIStackView(frame: scrollView.frame)
        stackView.axis = .vertical
        stackView.addArrangedSubview(thumbnail)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(body)
        
        let height : CGFloat
        if article?.thumbnail != nil {
            let screenSize = UIScreen.main.bounds.size
            height = screenSize.height / 5
        } else {
            height = 0
        }
        
        thumbnail.anchor(top: stackView.topAnchor, left: stackView.leftAnchor, bottom: nil, right: stackView.rightAnchor, height: height)
        
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, padding: Padding(vertical: .ONE_AND_HALF, horizontal: .ONE))
    }
    
}
