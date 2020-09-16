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
    private var savedTodoItems = [String: Bool]()
    private var todoList = [Todo]()
    
    init(view: HomeViewControllerDelegate) {
        self.view = view
    }
    
    func presentTodoItems(response: TodoListResponse) {
        todoList = response.items.map { item in
            let isCompleted = savedTodoItems[item.id]
            return Todo(id: item.id, text: item.text, dayId: item.dayId, isCompleted: isCompleted ?? false)
        }
        let filtered = todoList.filter({$0.dayId == 0})
        view?.handleOutputs(.showTodoList(filtered))
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
    
    func selected(at id: Int) {
        let filtered = todoList.filter({$0.dayId == id})
        view?.handleOutputs(.showTodoList(filtered))
    }
    
    func setCompleted(id: String, isCompleted: Bool) {
        if let index = todoList.firstIndex(where: {$0.id == id}) {
            todoList[index].isCompleted = !todoList[index].isCompleted
        }
    }
}
