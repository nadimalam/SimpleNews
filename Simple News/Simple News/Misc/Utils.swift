//
//  Utils.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func displayAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
                fatalError("keyWindow has no rootViewController")
            }
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
