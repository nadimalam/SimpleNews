//
//  ArticleViewModel.swift
//  Simple News
//
//  Created by Nadim Alam on 24/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    private let article: Article?
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String {
        guard let title = article?.title else {
            return String.empty
        }
        return title
    }
    
    var description: String {
        guard let description = article?.description else {
            return String.empty
        }
        return description
    }
    
    var sourceName: String {
        guard let sourceName = article?.source?.name else {
            return String.empty
        }
        return sourceName
    }
    
    // Calculate and display the article date.
    var publishedDate: String {
        guard let publishedDate = article?.publishedAt else {
            return "No Date"
        }
        return convertDate(publishedDate: publishedDate)
    }
    
    var imageURL: String {
        guard let imageURL = article?.urlToImage else {
            return "default-news"
        }
        return imageURL
    }
    
    private func convertDate(publishedDate: String) -> String {
        // Converts string to date format with extension
        let date = Date.FromString(publishedDate)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        guard let unwrappedDate = date else { return "No Date" }
        let stringDate = formatter.string(from: unwrappedDate)
        
        return stringDate
    }
}
