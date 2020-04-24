//
//  ViewController.swift
//  SimpleDiary
//
//  Created by Hoang Tung on 4/21/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let diaryTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(DiaryTableViewCell.self, forCellReuseIdentifier: "DiaryCell")
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addComponent()
    layoutView()
    setupTableView()
    setupNavigation()
  }
  
  func addComponent() {
    view.addSubview(diaryTableView)
  }
  
  func layoutView() {
    diaryTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    diaryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    diaryTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    diaryTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
  }
  
  func setupTableView() {
    diaryTableView.delegate = self
    diaryTableView.dataSource = self
  }
  
  func setupNavigation() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(routeNewTaskScene))
  }
  
  @objc func routeNewTaskScene() {
    let destinationVC = NewTaskViewController()
    destinationVC.mainVC = self
    navigationController?.show(destinationVC, sender: nil)
    destinationVC.title = "Công việc mới"
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let tasks = DBManager.sharedInstance.getAllTask()
    return tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryTableViewCell
    let tasks = DBManager.sharedInstance.getAllTask()
    cell.task = tasks[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let destinationVC = EditTaskViewController()
    let cell = tableView.cellForRow(at: indexPath) as! DiaryTableViewCell
    destinationVC.taskId = cell.taskId
    destinationVC.taskTextField.text = cell.taskNameLabel.text
    destinationVC.startTimeTextField.text = cell.startTimeInputLabel.text
    destinationVC.timeTextField.text = cell.timeInputLabel.text
    navigationController?.show(destinationVC, sender: nil)
    destinationVC.title = "Sửa công việc"
  }
}
