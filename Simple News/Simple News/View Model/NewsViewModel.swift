//
//  NewsViewModel.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

protocol NewsViewModelProtocol {
    var service: NewsServiceProtocol { get }
    var news: Observe<News?> { get }
    var articles: [Article]? { get }
    
    func fetchNewsArticles(for newsType:NewsType)
}

struct NewsViewModel: NewsViewModelProtocol {
    let service: NewsServiceProtocol
    let news: Observe<News?> = Observe(nil)
    
    init(service: NewsServiceProtocol = NewsService.shared) {
        self.service = service
    }
    
    var articles: [Article]? {
        guard let articles = news.value?.articles else {
            return []
        }
        return articles
    }
    
    func fetchNewsArticles(for newsType:NewsType) {
        service.fetchNewsArticles(for: newsType, completionHandler: { news, error in
            self.news.value = news
        })
    }
}
