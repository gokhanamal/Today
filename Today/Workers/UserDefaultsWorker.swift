//
//  UserDefaultsWorker.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class UserDefaultsWorker {
    private let todoItemsKey = "todo"
    
    var todoItems = [String: Bool]()
    
    func fetchCompletedTodoItems(completion: (Result<[String: Bool], Error>) -> Void)  {
        if let result = UserDefaults.standard.dictionary(forKey: todoItemsKey) as? [String: Bool] {
            todoItems = result
            completion(.success(todoItems))
        } else {
            completion(.failure(UserDefaultsError.keyNotFound))
        }
        
    }

    func setCompleted(id: String, isCompleted: Bool) {
        todoItems[id] = isCompleted
        save()
    }
    
    private func save() {
        UserDefaults.standard.set(todoItems, forKey: todoItemsKey)
    }
    
}

enum UserDefaultsError: Error {
    case keyNotFound
}

extension UserDefaultsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .keyNotFound:
            return NSLocalizedString("The key that you given not found.", comment: "Not found")
        }
    }
}
