//
//  FakeDayList.swift
//  TodayTests
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImage
@testable import Today

extension Day {
    static func fake() -> [Day] {
        return [
            Day(image: UIImage(named: "todo")!, name: "Monday"),
            Day(image: UIImage(named: "todo")!, name: "Tuesday"),
            Day(image: UIImage(named: "todo")!, name: "Wednesday"),
            Day(image: UIImage(named: "todo")!, name: "Thursday"),
            Day(image: UIImage(named: "todo")!, name: "Friday"),
            Day(image: UIImage(named: "todo")!, name: "Saturday"),
            Day(image: UIImage(named: "todo")!, name: "Sunday")
        ]
    }
}
