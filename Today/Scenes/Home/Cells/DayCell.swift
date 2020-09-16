//
//  DayCell.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import UIKit


final class DayCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    static let reuseIdentifier = "DayCell"
    
    func setup(with day: Day) {
        imageView.image = day.image
        nameLabel.text = day.name
        containerView.layer.cornerRadius = 10
    }
}
