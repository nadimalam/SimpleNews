//
//  NewsViewController.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = NewsViewModel()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getNewsArticles()
    }
    
    private func bind() {
        viewModel.news.bind { [unowned self] news in
            guard let _ = news else {
                //Handle error
                return
            }
            self.tableView.reloadData()
        }
    }
    
    func setupRefreshControl() {
        self.tableView.refreshControl = refreshControl
        self.tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        self.tableView.refreshControl?.tintColor = UIColor.blue
        self.tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to Refresh")
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        // Update the data
        getNewsArticles()
        self.tableView.refreshControl?.endRefreshing()
    }
    
    private func getNewsArticles() {
        if let tabBarIndex = self.tabBarController?.selectedIndex {
            viewModel.getNewsArticles(forAPI: viewModel.getApiForTabIndex(tabBarIndex))
        }
    }
}

extension NewsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.setEmptyTableViewMessage(tableView: self.tableView)
        return viewModel.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellIdentifier, for: indexPath) as? ArticleTableViewCell,
            let articles = self.viewModel.articles else {
                return UITableViewCell()
        }
        
        let article = articles[indexPath.row]
        let cellViewModel = ArticleViewModel(article: article)
        cell.viewModel = cellViewModel
        
        return cell
    }        
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}