//
//  TodayTests.swift
//  TodayTests
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import XCTest
@testable import Today

class TodayTests: XCTestCase {
    
    var view: HomeMockView!
    var presenter: HomePresenterProtocol!
    var interactor: HomeInteractorProtocol!
    
    override func setUp() {
        view = HomeMockView()
        presenter = HomePresenter(view: view)
        let mainWorker = MockMainWorker()
        let userDefaultsWorker = UserDefaultsWorker()
        interactor = HomeInteractor(worker: mainWorker, userDefaultsWorker: userDefaultsWorker, presenter: presenter)
        interactor.viewDidLoad()
    }
    
    func testExample() throws {
        XCTAssertEqual(view.outputs.count, 2)
        
        XCTAssertEqual(view.outputs.first, .showTodoList(Todo.fake()))
        XCTAssertEqual(view.outputs[1], .showDayList(Day.fake()))
    }
}

final class HomeMockView: HomeViewControllerDelegate {
    var outputs = [HomePresenterOutputs]()
    
    func handleOutputs(_ output: HomePresenterOutputs) {
        outputs.append(output)
    }
}
