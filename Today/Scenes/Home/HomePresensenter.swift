//
//  HomePresensenter.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewControllerDelegate?
    var savedTodoItems = [String: Bool]()
    
    init(view: HomeViewControllerDelegate) {
        self.view = view
    }
    
    func presentTodoItems(response: TodoListResponse) {
        let todoList: [Todo] = response.items.map { item in
            if let isCompleted = savedTodoItems[item.id] {
                return Todo(id: item.id, text: item.text, dayId: item.dayId, isCompleted: isCompleted)
            } else {
                return Todo(id: item.id, text: item.text, dayId: item.dayId, isCompleted: false)
            }
        }
        view?.handleOutputs(.showTodoList(todoList))
    }
    
    func presentSavedTodoItems(response: [String: Bool]) {
        savedTodoItems = response
    }
    
    func presentDays(days: [Day]) {
        view?.handleOutputs(.showDayList(days))
    }
    
    func presentError(error: Error) {
        view?.handleOutputs(.showError(error.localizedDescription))
    }
}
