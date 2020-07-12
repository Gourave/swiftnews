//
//  Api+Articles.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

extension Api {
    
    func fetchArticles(completion: @escaping Completion<[Article]>) {
        makeRequest("/.json", ofType: ArticleList.self) { result in
            switch result {
            case .success(let articleList):
                completion(.success(articleList.articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
