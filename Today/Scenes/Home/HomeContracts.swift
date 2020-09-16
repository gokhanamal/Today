//
//  HomeContracts.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UINavigationController

protocol HomeViewControllerDelegate: class {
    func handleOutputs(_ output: HomePresenterOutputs)
}

protocol HomePresenterProtocol {
    func presentTodoItems(response: TodoListResponse)
    func presentSavedTodoItems(response: [String: Bool])
    func presentDays(days: [Day])
    func selected(at id: Int)
    func setCompleted(id: String, isCompleted: Bool)
    func presentError(error: Error)
}

protocol HomeInteractorProtocol {
    func viewDidLoad()
    func setCompleted(id: String, isCompleted: Bool)
    func selected(at id: Int)
}

protocol HomeBuilderProtocol {
    static func make() -> UINavigationController
}

enum HomePresenterOutputs: Equatable {
    case showDayList([Day])
    case showTodoList([Todo])
    case showError(String)
    
    static func == (lhs: HomePresenterOutputs, rhs: HomePresenterOutputs) -> Bool {
        switch (lhs, rhs) {
        case (.showDayList(let listA), .showDayList(let listB)):
            return listA.count == listB.count
        case (.showTodoList(let listA), .showTodoList(let listB)):
        return listA.count == listB.count
        default:
            return true
        }
    }
}
