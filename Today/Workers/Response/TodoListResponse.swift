//
//  TodoListResponse.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

struct TodoListResponse: Codable {
    let items: [TodoResponse]
}

struct TodoResponse: Codable {
    let id: String
    let text: String
    let dayId: Int
}
