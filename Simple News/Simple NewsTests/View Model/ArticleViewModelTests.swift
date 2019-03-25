//
//  ArticleViewModelTests.swift
//  Simple NewsTests
//
//  Created by Nadim Alam on 24/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import XCTest
@testable import Simple_News

class ArticleViewModelTests: XCTestCase {

    var viewModel: ArticleViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ArticleViewModel(article: Article.fakeArticle())
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testArticleTitleGetsSet() {
        XCTAssertEqual(viewModel.title, "Scarlett Moffatt finds love with hunky policeman")
    }
    
    func testArticleDescriptionGetsSet() {
        XCTAssertEqual(viewModel.description, "Gogglebox favourite Scarlett Moffatt has finally found love again with a handsome policeman named Scott Dobinson")
    }
    
    func testArticleSourceNameGetsSet() {
        XCTAssertEqual(viewModel.sourceName, "BBC News")
    }
    
    func testArticleImageURLGetsSet() {
        XCTAssertEqual(viewModel.imageURL, "https://i2-prod.mirror.co.uk/incoming/article14152691.ece/ALTERNATES/s1200/0_Scarlett-Moffatt-and-Scott-Dobinson.jpg")
    }
    
    func testArticlePublishedDateGetsSet() {
        XCTAssertEqual(viewModel.publishedDate, "Monday, Mar 18, 2019 12:00 PM")
    }
    
    func testArticleCellIdentifierGetsSet() {
        XCTAssertEqual(ArticleTableViewCell.cellIdentifier, "ArticleTableViewCell")
    }
}
