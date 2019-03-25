//
//  NewsService.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation
import UIKit

enum RequestError: Swift.Error {
    case invalidURL
    case unknown
}

protocol NewsServiceProtocol {
    func getNewsArticles(forAPI api:String, completionHandler: @escaping (News?, RequestError?) -> Void)
}

class NewsService: NewsServiceProtocol {
    static let shared = NewsService()
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getNewsArticles(forAPI api:String, completionHandler: @escaping (News?, RequestError?) -> Void) {
        
        // Display the activity indicator when trying to fetch data.
        shouldShowActivityIndicator(true)
        
        // Check the URL
        guard let url = URL(string: api) else {
            DispatchQueue.main.async {
                self.shouldShowActivityIndicator(false)
                Utils.displayAlert(title: ERROR_TITLE, message: ERROR_MSG_URL)
                return completionHandler(nil, RequestError.invalidURL)
            }
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            // Check if we get any data.
            guard let data = data else {
                DispatchQueue.main.async {
                    self.shouldShowActivityIndicator(false)
                    Utils.displayAlert(title: ERROR_TITLE, message: ERROR_MSG_UNKNOWN)
                    completionHandler(nil, RequestError.unknown)
                }
                return
            }
            
            let newsModel = try? JSONDecoder().decode(News.self, from: data)
            
            DispatchQueue.main.async {
                self.shouldShowActivityIndicator(false)
                completionHandler(newsModel, nil)
            }
        }
        task.resume()
    }
    
    private func shouldShowActivityIndicator(_ show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}
