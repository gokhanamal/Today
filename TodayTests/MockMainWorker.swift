//
//  MockMainWorker.swift
//  TodayTests
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
@testable import Today

final class MockMainWorker: MainWorkerProtocol {
    func fetchTodoItems(completion: @escaping (Result<TodoListResponse, Error>) -> Void) {
        completion(.success(TodoListResponse(items: TodoResponse.fake())))
    }
}
