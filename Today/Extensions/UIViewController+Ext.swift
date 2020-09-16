//
//  UIViewController+Ext.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIViewController
import class UIKit.UIAlertController
import class UIKit.UIAlertAction

extension UIViewController {
    func showAlert(title: String, message: String?, actions: [UIAlertAction] = []) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if actions.count > 0 {
            for action in actions {
                vc.addAction(action)
            }
        } else {
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            vc.addAction(action)
        }
        self.present(vc, animated: true, completion: nil)
      }
}
