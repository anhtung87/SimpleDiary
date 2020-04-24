//
//  NewTaskViewController.swift
//  SimpleDiary
//
//  Created by Hoang Tung on 4/24/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {
  
  var mainVC: ViewController? = nil
  
  var taskId: String?
  
  let taskNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Công việc"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  let taskTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.textAlignment = .center
    textField.borderStyle = .line
    return textField
  }()
  
  let startTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Bắt đầu"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  let startTimeTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.textAlignment = .center
    textField.borderStyle = .line
    return textField
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Thời gian"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  let timeTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.textAlignment = .center
    textField.borderStyle = .line
    return textField
  }()
  
  let deleteButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemRed
    button.setTitle("Xoá", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupView()
    layoutView()
    setupNavigation()
    setupButton()
  }
  
  func setupView() {
    view.addSubview(taskNameLabel)
    view.addSubview(taskTextField)
    view.addSubview(startTimeLabel)
    view.addSubview(startTimeTextField)
    view.addSubview(timeLabel)
    view.addSubview(timeTextField)
    view.addSubview(deleteButton)
  }
  
  func layoutView() {
    let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    taskNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight + navigationBarHeight + 16).isActive = true
    taskNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    taskNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    taskNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    taskTextField.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 8).isActive = true
    taskTextField.leadingAnchor.constraint(equalTo: taskNameLabel.leadingAnchor).isActive = true
    taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    taskTextField.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    startTimeLabel.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 16).isActive = true
    startTimeLabel.leadingAnchor.constraint(equalTo: taskTextField.leadingAnchor).isActive = true
    startTimeLabel.trailingAnchor.constraint(equalTo: taskTextField.trailingAnchor).isActive = true
    startTimeLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    startTimeTextField.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 8).isActive = true
    startTimeTextField.leadingAnchor.constraint(equalTo: startTimeLabel.leadingAnchor).isActive = true
    startTimeTextField.trailingAnchor.constraint(equalTo: startTimeLabel.trailingAnchor).isActive = true
    startTimeTextField.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: startTimeTextField.bottomAnchor, constant: 16).isActive = true
    timeLabel.leadingAnchor.constraint(equalTo: startTimeTextField.leadingAnchor).isActive = true
    timeLabel.trailingAnchor.constraint(equalTo: startTimeTextField.trailingAnchor).isActive = true
    timeLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    timeTextField.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8).isActive = true
    timeTextField.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
    timeTextField.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor).isActive = true
    timeTextField.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    deleteButton.topAnchor.constraint(equalTo: timeTextField.bottomAnchor, constant: 32).isActive = true
    deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    deleteButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33).isActive = true
    deleteButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
  
  func setupNavigation() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTask))
  }
  
  @objc func saveTask() {
    if !taskTextField.text!.isEmpty || !startTimeTextField.text!.isEmpty || timeTextField.text!.isEmpty {
      saveToMemory()
      routeToMain()
    }
  }
  
  func routeToMain() {
    navigationController?.popViewController(animated: true)
    mainVC?.view.layoutIfNeeded()
  }
  
  func saveToMemory() {
    let newTask = Task()
    newTask.name = taskTextField.text!
    newTask.startTime = startTimeTextField.text!
    newTask.time = timeTextField.text!
    newTask.ID = taskId!
    DBManager.sharedInstance.updateTaskById(taskId!, newTask)
  }
  
  func setupButton() {
    deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
  }
  
  @objc func deleteTask() {
    DBManager.sharedInstance.deleteTaskById(taskId!)
    routeToMain()
  }
}
