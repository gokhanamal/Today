//
//  MainWorker.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class MainWorker: MainWorkerProtocol {
    func fetchTodoItems(completion: @escaping (Result<TodoListResponse, Error>) -> Void) {
        let bundle = Bundle(for: MainWorker.self)
        let url = bundle.url(forResource: "todo", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let service = try JSONDecoder().decode(TodoListResponse.self, from: data)
            completion(.success(service))
        } catch {
            completion(.failure(error))
        }
    }
}
