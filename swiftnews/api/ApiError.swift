//
//  ApiError.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

class ApiError : Error {
    
    let statusCode: Int
    let errorMessage: String
    
    init(_ statusCode: Int, errorMessage: String) {
        self.statusCode = statusCode
        self.errorMessage = errorMessage
    }
    
}
