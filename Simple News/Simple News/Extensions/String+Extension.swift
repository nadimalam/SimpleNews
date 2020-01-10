//
//  String+Extension.swift
//  Simple News
//
//  Created by Nadim Alam on 10/01/2020.
//  Copyright © 2020 Nadim Alam. All rights reserved.
//

import Foundation

extension String {
    private enum SpecialCharacter: String {
        case empty = ""
        case space = " "
        case breakLine = "\n"
        case slash = "/"
        case dash = "-"
    }
    
    static let empty = SpecialCharacter.empty.rawValue
    static let space = SpecialCharacter.space.rawValue
    static let breakLine = SpecialCharacter.breakLine.rawValue
    static let slash = SpecialCharacter.slash.rawValue
    static let dash = SpecialCharacter.dash.rawValue
}
