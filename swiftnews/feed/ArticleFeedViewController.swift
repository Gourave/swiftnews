//
//  NewsFeedViewController.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

class ArticleFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift News"
        setupViews()
    }
    
    func setupViews() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // We only have 1 section of articles to show
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Update with actual data from ViewModel
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Update with actual cell
        return UITableViewCell()
    }


}

