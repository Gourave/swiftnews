//
//  Api.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import Alamofire

class Api {
    
    typealias Completion<T : Decodable> = (Result<T, ApiError>) -> Void
    
    fileprivate static let HOST = "https://www.reddit.com/r/swift"
    
    fileprivate init() {
    }
    
    static func instance() -> Api {
        return Api()
    }
    
    func makeRequest<T : Decodable>(_ endpoint: String,
                                    ofType decodableType: T.Type,
                                    completion: @escaping Completion<T>) {
        let url = "\(Api.HOST)\(endpoint)"
        AF.request(url)
            .responseDecodable(of: decodableType) { response in
                if let error = response.error, let statusCode = response.response?.statusCode {
                    let apiError = ApiError(statusCode, errorMessage: error.localizedDescription)
                    completion(.failure(apiError))
                    return
                }
                
                if let data = response.value {
                    #if DEBUG
                    print(data)
                    #endif
                    
                    completion(.success(data))
                }
        }
    }
    
}
