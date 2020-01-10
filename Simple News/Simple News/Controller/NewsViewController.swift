//
//  NewsViewController.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    private let viewModel = NewsViewModel()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchNewsArticles()
    }
    
    private func bind() {
        self.viewModel.news.bind { [unowned self] news in
            self.tableView?.reloadData()
            self.shouldShowActivityIndicator(false)
            guard let _ = news else {
                //Handle error
                return
            }
        }
    }
    
    private func shouldShowActivityIndicator(_ show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
    private func setupRefreshControl() {
        self.tableView?.refreshControl = refreshControl
        self.tableView?.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        self.tableView?.refreshControl?.tintColor = UIColor.blue
        self.tableView?.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to Refresh")
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        // Update the data
        self.fetchNewsArticles()
        self.tableView?.refreshControl?.endRefreshing()
    }
    
    private func fetchNewsArticles() {
        if let tabBarIndex = self.tabBarController?.selectedIndex {
            // Display the activity indicator when trying to fetch data.
            self.shouldShowActivityIndicator(true)
            self.viewModel.fetchNewsArticles(for: NewsType.init(section: tabBarIndex))
        }
    }
}

extension NewsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.setEmptyTableViewMessage(tableView: self.tableView)
        return self.viewModel.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellIdentifier, for: indexPath) as? ArticleTableViewCell,
            let articles = self.viewModel.articles,
            !articles.isEmpty else {
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
        self.tableView?.deselectRow(at: indexPath, animated: true)
        
        if let articles = self.viewModel.articles {
            guard !articles.isEmpty else { return }
            let article = articles[indexPath.row]
            let model = ArticleViewModel(article: article)
            let destinationVC = NewsDetailViewController(viewModel: model)
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
}
