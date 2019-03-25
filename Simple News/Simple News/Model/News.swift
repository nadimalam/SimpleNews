//
//  News.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

struct News: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

extension News {
    static func fakeNews() -> News {
        let news = News(status: "ok",
                        totalResults: 1,
                        articles: [Article.fakeArticle()])
        return news
    }
}
