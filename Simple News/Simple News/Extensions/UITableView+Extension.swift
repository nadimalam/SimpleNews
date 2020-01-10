//
//  UITableView+Extension.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Avenir-Light", size: 24)
        messageLabel.sizeToFit()
        self.separatorStyle = .none
        
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
