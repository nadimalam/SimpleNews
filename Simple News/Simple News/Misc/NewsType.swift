//
//  NewsType.swift
//  Simple News
//
//  Created by Nadim Alam on 09/01/2020.
//  Copyright © 2020 Nadim Alam. All rights reserved.
//

import Foundation

enum NewsType: String {
    case TopStories, Technology, Entertainment, Sports, Health, Science, Unknown
    
    init(section: Int = 0) {
        switch section {
        case 0:
            self = .TopStories
        case 1:
            self = .Technology
        case 2:
            self = .Entertainment
        case 3:
            self = .Sports
        case 4:
            self = .Health
        case 5:
            self = .Science
        default:
            self = .Unknown
        }
    }
}

extension NewsType: CustomStringConvertible {
     var description: String {
         switch self {
         case .TopStories:
             return API_TOP_HEADLINES_URL
         case .Technology:
             return API_TECHNOLOGY_URL
         case .Entertainment:
             return API_ENTERTAINMENT_URL
         case .Sports:
             return API_SPORTS_URL
         case .Health:
             return API_HEALTH_URL
         case .Science:
             return API_SCIENCE_URL
         case .Unknown:
             return String.empty
       }
    }
}
