//
//  TodoCell.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UITableViewCell
import class UIKit.UILabel
import class UIKit.UIImageView

final class TodoCell: UITableViewCell {
    
    @IBOutlet weak var checkMarkView: UIImageView!
    @IBOutlet weak var todoLabel: UILabel!
    
    static let reuseIdentifier = "TodoCell"

    
    
    func setup(with todo: Todo) {
        todoLabel.text = todo.text
        setCompleted(isCompleted: todo.isCompleted)
    }
    
    func setCompleted(isCompleted: Bool) {
        if isCompleted {
            checkMarkView.isHidden = false
        } else {
            checkMarkView.isHidden = true
        }
    }
}
