//
//  DiaryTableViewCell.swift
//  SimpleDiary
//
//  Created by Hoang Tung on 4/21/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
  
  let taskLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Công việc"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  let taskNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textAlignment = .right
    label.font = .systemFont(ofSize: 14)
    label.numberOfLines = 0
    return label
  }()
  
  let startTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Bắt đầu"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  var taskId: String?
  
  var task: Task? = nil {
    didSet {
      taskId = task?.ID
      taskNameLabel.text = task?.name
      startTimeInputLabel.text = task?.startTime
      timeInputLabel.text = task?.time
    }
  }
  
  let startTimeInputLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textAlignment = .right
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 14)
    return label
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Thời gian"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  let timeInputLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textAlignment = .right
    label.font = .systemFont(ofSize: 14)
    label.numberOfLines = 0
    return label
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    addComponent()
    setupLayout()
  }
  
  func addComponent() {
    self.addSubview(taskLabel)
    self.addSubview(startTimeLabel)
    self.addSubview(timeLabel)
    self.addSubview(taskNameLabel)
    self.addSubview(timeInputLabel)
    self.addSubview(startTimeInputLabel)
  }
  
  func setupLayout() {
    taskLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    taskLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
    taskLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    taskLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    
    startTimeLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 8).isActive = true
    startTimeLabel.leftAnchor.constraint(equalTo: taskLabel.leftAnchor).isActive = true
    startTimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    startTimeLabel.heightAnchor.constraint(equalTo: taskLabel.heightAnchor).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: startTimeInputLabel.bottomAnchor, constant: 8).isActive = true
    timeLabel.leftAnchor.constraint(equalTo: taskLabel.leftAnchor).isActive = true
    timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    timeLabel.heightAnchor.constraint(equalTo: taskLabel.heightAnchor).isActive = true
    
    taskNameLabel.topAnchor.constraint(equalTo: taskLabel.topAnchor).isActive = true
    taskNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
    taskNameLabel.leftAnchor.constraint(greaterThanOrEqualTo: taskLabel.rightAnchor, constant: 16).isActive = true
    taskNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    
    startTimeInputLabel.topAnchor.constraint(equalTo: startTimeLabel.topAnchor).isActive = true
    startTimeInputLabel.rightAnchor.constraint(equalTo: taskNameLabel.rightAnchor).isActive = true
    startTimeInputLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    startTimeInputLabel.leftAnchor.constraint(equalTo: startTimeLabel.rightAnchor, constant: 16).isActive = true
    
    timeInputLabel.topAnchor.constraint(equalTo: timeLabel.topAnchor).isActive = true
    timeInputLabel.rightAnchor.constraint(equalTo: taskNameLabel.rightAnchor).isActive = true
    timeInputLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    timeInputLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 16).isActive = true
    timeInputLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
  }
}
