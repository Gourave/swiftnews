//
//  ArticleTableViewCell.swift
//  Swift News
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

class ArticleTableViewCell : UITableViewCell {
    
    fileprivate let titleLabel = UILabel()
    fileprivate let thumbnail = UIImageView()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var thumbnailUrl: String? = nil {
        didSet {
            // Remove the thumbnail from the view is the url is nil
            guard let url = thumbnailUrl else {
                thumbnail.removeFromSuperview()
                return
            }
            
            // Add thumbnail imageview when we have a valid thumbnail url
            addSubview(thumbnail)
            let screenSize = UIScreen.main.bounds.size
            let height = screenSize.height / 10
            thumbnail.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: height)
            thumbnail.loadImage(from: url)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
    }
    
}
