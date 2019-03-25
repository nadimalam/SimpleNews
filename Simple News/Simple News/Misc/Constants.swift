//
//  Constants.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

// URL Example: https://newsapi.org/v2/top-headlines?country=us&apiKey=06dcd4b996194624ad3ec88569ee4481

// MARK: - API URL's
var API_TOP_HEADLINES_URL: String = "https://newsapi.org/v2/top-headlines?country=\(API_COUNTRY)&sortBy=publishedAt&pageSize=100&apiKey=\(API_KEY)"
var API_TECHNOLOGY_URL: String = "https://newsapi.org/v2/top-headlines?country=\(API_COUNTRY)&sortBy=publishedAt&category=technology&pageSize=100&apiKey=\(API_KEY)"
var API_ENTERTAINMENT_URL: String = "https://newsapi.org/v2/top-headlines?country=\(API_COUNTRY)&sortBy=publishedAt&category=entertainment&pageSize=100&apiKey=\(API_KEY)"
var API_SPORTS_URL: String = "https://newsapi.org/v2/top-headlines?country=\(API_COUNTRY)&sortBy=publishedAt&category=sports&pageSize=100&apiKey=\(API_KEY)"
var API_HEALTH_URL: String = "https://newsapi.org/v2/top-headlines?country=\(API_COUNTRY)&sortBy=publishedAt&category=health&pageSize=100&apiKey=\(API_KEY)"
var API_SCIENCE_URL: String = "https://newsapi.org/v2/top-headlines?country=\(API_COUNTRY)&sortBy=publishedAt&category=science&pageSize=100&apiKey=\(API_KEY)"

private let API_KEY: String = "06dcd4b996194624ad3ec88569ee4481"
private let API_COUNTRY: String = "gb"

// MARK: - Alert View Strings
let ERROR_TITLE: String = "Oops..."
let ERROR_MSG_URL: String = "Something went wrong with the API"
let ERROR_MSG_UNKNOWN: String = "Something went wrong"

// MARK: - TableView Strings
let EMPTY_TABLE_MESSAGE: String = "No articles can be found. \nPlease try again."
