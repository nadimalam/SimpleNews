//
//  NewsServiceMock.swift
//  Simple NewsTests
//
//  Created by Nadim Alam on 24/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation
import UIKit

@testable import Simple_News

class NewsServiceMock: NewsServiceProtocol {

    var errorMock: RequestError? = nil
    var getNewsMock: News? = nil
    
    func fetchNewsArticles(forAPI api: String, completionHandler: @escaping (News?, RequestError?) -> Void) {
        completionHandler(getNewsMock, errorMock)
    }
}
