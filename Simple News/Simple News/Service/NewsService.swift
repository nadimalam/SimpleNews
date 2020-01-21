//
//  NewsService.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

enum RequestError: Swift.Error {
    case invalidURL
    case unknown
}

protocol NewsServiceProtocol {
    func fetchNewsArticles(for newsType:NewsType, completionHandler: @escaping (News?, RequestError?) -> Void)
}

class NewsService: NewsServiceProtocol {
    static let shared = NewsService()
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchNewsArticles(for newsType:NewsType, completionHandler: @escaping (News?, RequestError?) -> Void) {
        
        // Check the URL
        guard let url = URL(string: newsType.description) else {
            if let data = retrieveCache(for: newsType),
            let newsModel = try? JSONDecoder().decode(News.self, from: data) {
                DispatchQueue.main.async {
                    return completionHandler(newsModel, RequestError.invalidURL)
                }
            }
            Utils.displayAlert(title: ERROR_TITLE, message: ERROR_MSG_URL)
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            // Check if we get any data.
            guard let data = data else {
                if let data = self.retrieveCache(for: newsType),
                let newsModel = try? JSONDecoder().decode(News.self, from: data) {
                    DispatchQueue.main.async {
                        completionHandler(newsModel, RequestError.unknown)
                    }
                }
                Utils.displayAlert(title: ERROR_TITLE, message: ERROR_MSG_UNKNOWN)
                return
            }
            
            // Cache the data
            self.saveCache(data: data, for: newsType)
            
            if let newsModel = try? JSONDecoder().decode(News.self, from: data) {
                DispatchQueue.main.async {
                    completionHandler(newsModel, nil)
                }
            }
        }
        task.resume()
    }
}

extension NewsService: CacheDelegate {
    func saveCache(data: Data, for newsType: NewsType) {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: newsType.rawValue)
    }
    
    func retrieveCache(for newsType: NewsType) -> Data? {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: newsType.rawValue) {
            return data as? Data
        }
        return nil
    }
}
