//
//  String+URL.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-12.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

extension String {
    
    // From https://stackoverflow.com/a/49072718
    func isValidUrl() -> Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
}
