//
//  NewsServiceTests.swift
//  Simple NewsTests
//
//  Created by Nadim Alam on 25/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import XCTest
@testable import Simple_News

class NewsServiceTests: XCTestCase {

    var session: URLSessionMock!
    var news: News!
    var newsService: NewsService!
    var parsingError: RequestError?
    var signalExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        signalExpectation = expectation(description: "The URL was downloaded")
        session = URLSessionMock()
        newsService = NewsService(session: session)
    }
    
    override func tearDown() {
        session = nil
        news = nil
        newsService = nil
        parsingError = nil
        super.tearDown()
    }
    
    func testRequestNewsReturnsNews() {
        
        let jsonString = Fixture.getJSON(jsonPath: "NewsArticle")
        let data = jsonString?.data(using: String.Encoding.utf8)
        
        session.data = data
        
        newsService.fetchNewsArticles(for: NewsType.TopStories, completionHandler: { news, error in
            self.news = news
            self.parsingError = error
            self.signalExpectation?.fulfill()
        })
        
        waitForExpectations(timeout: 10) { _ in
            XCTAssertNil(self.parsingError, "Error is nil for news data")
            XCTAssertNotNil(self.news, "News should not be nil")
        }
    }
    
    func testWhenResponseDataIsNilReturnsError() {
        
        newsService.fetchNewsArticles(for: NewsType.TopStories, completionHandler: { news, error in
            self.news = news
            self.parsingError = error
            self.signalExpectation?.fulfill()
        })
        
        waitForExpectations(timeout: 10) { _ in
            XCTAssertEqual(self.parsingError, RequestError.unknown, "Error is not nil when data is invalid")
            XCTAssertNil(self.news, "News should be nil")
        }
    }
    
    func testWhenURLIsInvalidReturnsError() {
        
        newsService.fetchNewsArticles(for: NewsType.Unknown, completionHandler: { news, error in
            self.news = news
            self.parsingError = error
            self.signalExpectation?.fulfill()
        })
        
        waitForExpectations(timeout: 10) { _ in
            XCTAssertEqual(self.parsingError, RequestError.invalidURL, "Error is not nil when url is invalid")
            XCTAssertNil(self.news, "News should be nil")
        }
    }
}
