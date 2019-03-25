//
//  NewsViewModelTests.swift
//  Simple NewsTests
//
//  Created by Nadim Alam on 24/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import XCTest
@testable import Simple_News

class NewsViewModelTests: XCTestCase {
    
    var newsService: NewsServiceMock!
    
    override func setUp() {
        super.setUp()
        newsService = NewsServiceMock()
    }
    
    override func tearDown() {
        newsService = nil
        super.tearDown()
    }
    
    func testGetNewsReturnsNews() {
        
        newsService.getNewsMock = News.fakeNews()
        
        let viewModel = NewsViewModel(service: newsService)
        viewModel.getNewsArticles(forAPI: API_TOP_HEADLINES_URL)
        
        newsService.getNewsArticles(forAPI: API_TOP_HEADLINES_URL, completionHandler: { (news, error) in
            XCTAssertNotNil(news, "News should be not nil")
            XCTAssertNil(error, "Error is nil when we get news data")                        
        })
    }
}
