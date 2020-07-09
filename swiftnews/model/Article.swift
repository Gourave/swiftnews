//
//  Article.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

struct Article : Decodable {
    
    let title : String
    let thumbnail : String?
    let body : String
    
    enum CodingKeys : String, CodingKey {
        case title
        case thumbnail
        case body = "selftext"
    }
    
}


//"author_fullname": "t2_30vizfh0",
//"title": "Mastering grids in SwiftUI",
//"thumbnail_height": 41,
//"name": "t3_hnjagw",
//"thumbnail": "https://b.thumbs.redditmedia.com/UrqVSG03H0cDSxEB0Dhtzp5w2IPZb_Kl3Et5vU-wXbc.jpg",
//"domain": "swiftwithmajid.com",
//"url_overridden_by_dest": "https://swiftwithmajid.com/2020/07/08/mastering-grids-in-swiftui/",
//"permalink": "/r/swift/comments/hnjagw/mastering_grids_in_swiftui/",
//"url": "https://swiftwithmajid.com/2020/07/08/mastering-grids-in-swiftui/",
