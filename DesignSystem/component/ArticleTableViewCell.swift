//
//  ArticleTableViewCell.swift
//  Swift News
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit
import Foundation

class ArticleTableViewCell : UITableViewCell {
    
    fileprivate let titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let thumbnail : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var thumbnailUrl: String? = nil {
        didSet {
            // Remove the thumbnail from the view if the url is nil
            guard let url = thumbnailUrl else {
                thumbnail.isHidden = true
                thumbnail.image = nil
                return
            }
            
            thumbnail.isHidden = false
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
        let stackView = UIStackView(frame: frame)
        stackView.axis = .vertical
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(thumbnail)
        self.contentView.addSubview(stackView)
        
        stackView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, padding: Padding(vertical: .ONE, horizontal: .HALF))
        
        let screenSize = UIScreen.main.bounds.size
        let height = screenSize.height / 10
        thumbnail.anchor(height: height)
    }
    
}
