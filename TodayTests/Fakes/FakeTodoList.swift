//
//  FakeTodoList.swift
//  TodayTests
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
@testable import Today

extension TodoResponse {
    static func fake() -> [TodoResponse] {
        return [
            TodoResponse(id: "1", text: "Fake", dayId: 1),
            TodoResponse(id: "1", text: "Fake", dayId: 1),
            TodoResponse(id: "1", text: "Fake", dayId: 1),
            TodoResponse(id: "1", text: "Fake", dayId: 1)
        ]
    }
}

extension Todo {
    static func fake() -> [Todo] {
        return [
            Todo(id: "1", text: "Fake", dayId: 1, isCompleted: false),
            Todo(id: "1", text: "Fake", dayId: 1, isCompleted: false),
            Todo(id: "1", text: "Fake", dayId: 1, isCompleted: false),
            Todo(id: "1", text: "Fake", dayId: 1, isCompleted: false)
        ]
    }
}
