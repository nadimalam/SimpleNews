//
//  Article.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    struct Source: Codable {
        let id: String?
        let name: String?
    }
}

extension Article {
    static func mockArticle() -> Article {
        let article = Article(source: Article.Source.mockSource(),
                              author: "Joanna S Freedman",
                              title: "Scarlett Moffatt finds love with hunky policeman",
                              description: "Gogglebox favourite Scarlett Moffatt has finally found love again with a handsome policeman named Scott Dobinson",
                              url: "https://www.mirror.co.uk/3am/celebrity-news/scarlett-moffatt-finds-love-hunky-14152625",
                              urlToImage: "https://i2-prod.mirror.co.uk/incoming/article14152691.ece/ALTERNATES/s1200/0_Scarlett-Moffatt-and-Scott-Dobinson.jpg",
                              publishedAt: "2019-03-18T10:55:00Z",
                              content: "Scarlett Moffatt has been open about her string of failed relationships in the past. However, now it looks as if she has finally found The One in police constable Scott Dobinson. The I'm A Celebrity...Get Me Out Of Here! champ is said to have been dating hunk… [+1316 chars]")
        return article
    }
}

extension Article.Source {
    static func mockSource() -> Article.Source {
        let source = Article.Source(id: "bbc-news",
                            name: "BBC News")
        return source
    }
}
