//
//  Article.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

struct ArticleList : Decodable {
    
    let articles : [Article]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        let children = try data.decode([Children].self, forKey: .children)
        
        // Transform article objects from children into array of Articles
        articles = children.compactMap { child -> Article in
            child.article
        }
    }
    
    enum CodingKeys : String, CodingKey {
        case data
        case children
    }
    
}

struct Children : Decodable {
    
    let article : Article
    
    enum CodingKeys : String, CodingKey {
        case article = "data"
    }
}

struct Article : Decodable {
    
    let title : String
    let thumbnail : String?
    let body : String
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        
        // Some thumbnails contain non-valid links. Check links and set appropriately.
        let thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        guard let thumbnailUrl = thumbnail else {
            self.thumbnail = nil
            return
        }
        
        if thumbnailUrl.isValidUrl() {
            self.thumbnail = thumbnailUrl
        } else {
            self.thumbnail = nil
        }

    }
    
    enum CodingKeys : String, CodingKey {
        case title
        case thumbnail
        case body = "selftext"
    }
    
}
