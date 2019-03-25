//
//  Fixture.swift
//  Simple NewsTests
//
//  Created by Nadim Alam on 24/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

class Fixture: NSObject {
    
    static func getJSON(jsonPath: String) -> String? {
        
        guard let path = Bundle(for: Fixture.self).path(forResource: jsonPath, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                NSLog("************* No Fixture JSON found with name '\(jsonPath).json', did you add it to the fixtures? *************")
                return nil
        }
        
        let jsonString = String(data: data, encoding: String.Encoding.utf8)
        return jsonString
    }
}
