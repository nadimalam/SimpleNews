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
        if let title = article?.title {
            return title
        }
        return ""
    }
    
    var description: String {
        if let description = article?.description {
            return description
        }
        return ""
    }
    
    var sourceName: String {
        if let sourceName = article?.source?.name {
            return sourceName
        }
        return ""
    }
    
    // Calculate and display the article date.
    var publishedDate: String {
        if let publishedDate = article?.publishedAt {
            return convertDate(publishedDate: publishedDate)
        }
        return "No Date"
    }
    
    var imageURL: String {
        if let imageURL = article?.urlToImage {
            return imageURL
        }
        return "default-news"
    }
    
    func convertDate(publishedDate: String) -> String {
        // Converts string to date format with extension
        let date = Date.FromString(publishedDate)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        guard let unwrappedDate = date else { return "No Date" }
        let stringDate = formatter.string(from: unwrappedDate)
        
        return stringDate
    }
}
