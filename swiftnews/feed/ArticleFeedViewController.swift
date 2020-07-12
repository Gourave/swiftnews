//
//  NewsFeedViewController.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

class ArticleFeedViewController: UIViewController {

    fileprivate let presenter = ArticleFeedPresenter()
    fileprivate let tableView = UITableView()
    fileprivate let articleCellReuseId = "article"
    
    fileprivate var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift News"
        setupViews()

        presenter.attach(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.detach()
    }
    
    func setupViews() {
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: articleCellReuseId)
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension ArticleFeedViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // We only have 1 section of articles to show
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: articleCellReuseId, for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let article = articles[indexPath.row]
        
        cell.title = article.title
        if article.thumbnail?.isValidUrl() ?? false {
            cell.thumbnailUrl = article.thumbnail
        } else {
            cell.thumbnailUrl = nil
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = articles[indexPath.row]
        
        // TODO: Open new view controller and pass in article
    }
    
}

extension ArticleFeedViewController : ArticleFeedViewDelegate {

    func updateFeed(articles: [Article]) {
        self.articles = articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showAlert(errorMessage: String) {
        self.showAlert(title: "Error", message: errorMessage)
    }

}
