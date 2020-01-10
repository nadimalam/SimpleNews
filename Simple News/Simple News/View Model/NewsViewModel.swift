//
//  NewsViewModel.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation
import UIKit

protocol NewsViewModelProtocol {
    var service: NewsServiceProtocol { get }
    var news: Dynamic<News?> { get }
    var articles: [Article]? { get }
    
    func fetchNewsArticles(for newsType:NewsType)
}

struct NewsViewModel: NewsViewModelProtocol {
    let service: NewsServiceProtocol
    let news: Dynamic<News?> = Dynamic(nil)
    
    init(service: NewsServiceProtocol = NewsService.shared) {
        self.service = service
    }
    
    var articles: [Article]? {
        guard let articles = news.value?.articles else {
            return []
        }
        return articles
    }
    
    func setEmptyTableViewMessage(tableView: UITableView?) {        
        news.value?.articles?.count == 0 ?
            tableView?.setEmptyMessage(EMPTY_TABLE_MESSAGE) :
            tableView?.restore()
    }
    
    func fetchNewsArticles(for newsType:NewsType) {
        service.fetchNewsArticles(for: newsType, completionHandler: { news, error in
            self.news.value = news
        })
    }
}
