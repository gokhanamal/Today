//
//  WorkerContracts.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

protocol MainWorkerProtocol {
    func fetchTodoItems(completion: @escaping (Result<TodoListResponse, Error>) -> Void)
}
