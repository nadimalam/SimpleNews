//
//  NewsViewModel.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation
import UIKit

enum TabBarScreen: Int {
    case TopStories
    case Technology
    case Entertainment
    case Sports
    case Health
    case Science
}

protocol NewsViewModelProtocol {
    var service: NewsServiceProtocol { get }
    var news: Dynamic<News?> { get }
    var articles: [Article]? { get }
    
    func fetchNewsArticles(forAPI api:String)
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
    
    func getApiForTabIndex(_ selectedIndex: Int) -> String {
        switch selectedIndex {
        case TabBarScreen.TopStories.rawValue:
            return API_TOP_HEADLINES_URL
        case TabBarScreen.Technology.rawValue:
            return API_TECHNOLOGY_URL
        case TabBarScreen.Entertainment.rawValue:
            return API_ENTERTAINMENT_URL
        case TabBarScreen.Sports.rawValue:
            return API_SPORTS_URL
        case TabBarScreen.Health.rawValue:
            return API_HEALTH_URL
        case TabBarScreen.Science.rawValue:
            return API_SCIENCE_URL
        default:
            assertionFailure("Wrong API Definition")
            return API_TOP_HEADLINES_URL
        }
    }
    
    func setEmptyTableViewMessage(tableView: UITableView?) {        
        news.value?.articles?.count == 0 ?
            tableView?.setEmptyMessage(EMPTY_TABLE_MESSAGE) :
            tableView?.restore()
    }
    
    func fetchNewsArticles(forAPI api:String) {
        service.fetchNewsArticles(forAPI: api, completionHandler: { news, error in
            self.news.value = news
        })
    }
}
