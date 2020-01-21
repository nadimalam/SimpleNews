//
//  CacheProtocol.swift
//  Simple News
//
//  Created by Nadim Alam on 16/01/2020.
//  Copyright © 2020 Nadim Alam. All rights reserved.
//

import Foundation

protocol CacheDelegate {
    func saveCache(data: Data, for newsType: NewsType)
    func retrieveCache(for newsType: NewsType) -> Data?
}
