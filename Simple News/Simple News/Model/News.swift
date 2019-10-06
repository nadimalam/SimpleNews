//
//  News.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

extension News {
    static func mockNews() -> News {
        let news = News(status: "ok",
                        totalResults: 1,
                        articles: [Article.mockArticle()])
        return news
    }
}
