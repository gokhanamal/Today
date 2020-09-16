//
//  ViewController.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var interactor: HomeInteractorProtocol?
    
    private var todoList = [Todo]()
    private var currentTodoList = [Todo]()
    private var daysofWeek = [Day]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupCollectionView()
        setupnNavigationController()
        interactor?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupnNavigationController() {
        navigationItem.title = "To-do List"
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func handleOutputs(_ output: HomePresenterOutputs) {
        switch output {
        case .showDayList(let days):
            daysofWeek = days
            collectionView.reloadData()
        case .showTodoList(let todoList):
            self.todoList = todoList
            self.currentTodoList = todoList.filter{$0.dayId == 0}
        case .showError(let error):
            self.showAlert(title: "Error!", message: error)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTodoList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Today's todo list"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as! TodoCell
        let todo = currentTodoList[indexPath.row]
        cell.setup(with: todo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentTodo = currentTodoList[indexPath.row]
        let isCompleted = !currentTodo.isCompleted
        currentTodoList[indexPath.row].isCompleted = isCompleted
        tableView.reloadRows(at: [indexPath], with: .automatic)
        interactor?.setCompleted(id: currentTodo.id, isCompleted: isCompleted)
        
        if let index = todoList.firstIndex(where: {$0.id == currentTodo.id}) {
            let todo = todoList[index]
            todoList[index].isCompleted = !todo.isCompleted
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysofWeek.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.reuseIdentifier, for: indexPath) as! DayCell
        let day = daysofWeek[indexPath.row]
        cell.setup(with: day)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        currentTodoList = todoList.filter{$0.dayId == indexPath.row}
        
        if currentTodoList.isEmpty {
            tableView.isHidden = true
        } else {
            tableView.isHidden = false
            tableView.reloadData()
        }
        
    }
}
