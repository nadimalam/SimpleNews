//
//  Date+Extension.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation

extension Date {
    public static func FromString(_ dateString: String) -> Date? {
        // Date detector.
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
        
        // Enumerate matches.
        var matchedDate: Date?
        var matchedTimeZone: TimeZone?
        detector.enumerateMatches(
            in: dateString,
            options: [],
            range: NSRange(location: 0, length: dateString.utf16.count),
            using: {
                (eachResult, _, _) in
                
                // Lookup matches.
                matchedDate = eachResult?.date
                matchedTimeZone = eachResult?.timeZone
                
                // Convert to GMT (!) if no timezone detected.
                if matchedTimeZone == nil, let detectedDate = matchedDate {
                    matchedDate = Calendar.current.date(byAdding: .second,
                                                        value: TimeZone.current.secondsFromGMT(),
                                                        to: detectedDate)!
                }
        })        
        // Result.
        return matchedDate
    }
}
