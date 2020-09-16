//
//  HomeInteractor.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImage

final class HomeInteractor: HomeInteractorProtocol {
    var worker: MainWorker
    var userDefaultsWorker: UserDefaultsWorker
    var presenter: HomePresenterProtocol
    
    private var dayOfWeeks = [
          Day(image: UIImage(named: "todo")!, name: "Monday"),
          Day(image: UIImage(named: "todo")!, name: "Tuesday"),
          Day(image: UIImage(named: "todo")!, name: "Wednesday"),
          Day(image: UIImage(named: "todo")!, name: "Thursday"),
          Day(image: UIImage(named: "todo")!, name: "Friday"),
          Day(image: UIImage(named: "todo")!, name: "Saturday"),
          Day(image: UIImage(named: "todo")!, name: "Sunday")
      ]
    
    init(worker: MainWorker, userDefaultsWorker: UserDefaultsWorker, presenter: HomePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
        self.userDefaultsWorker = userDefaultsWorker
    }
    
    func viewDidLoad() {
        userDefaultsWorker.fetchCompletedTodoItems { result in
            switch(result) {
            case .success(let response):
                presenter.presentSavedTodoItems(response: response)
            case .failure(_):
                presenter.presentSavedTodoItems(response: [String: Bool]())
            }
        }
        
        worker.fetchTodoItems { [weak self] result in
            guard let `self` = self else { return }
            switch(result) {
            case .success(let response):
                self.presenter.presentTodoItems(response: response)
            case .failure(let error):
                self.presenter.presentError(error: error)
            }
        }
        
        self.presenter.presentDays(days: dayOfWeeks)
    }
    
    func setCompleted(id: String, isCompleted: Bool) {
        userDefaultsWorker.setCompleted(id: id, isCompleted: isCompleted)
    }
}
