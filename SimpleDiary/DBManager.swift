//
//  DBManager.swift
//  SimpleDiary
//
//  Created by Hoang Tung on 4/24/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
  private var database: Realm!
  static let sharedInstance = DBManager()
  
  private init() {
    database = try! Realm()
    print(database.configuration.fileURL!)
  }
  
  func addTask(_ task: Task) {
    try! database.write {
      task.ID = UUID().uuidString
      database.add(task)
    }
  }
  
  func getAllTask() -> Results<Task> {
    let tasks = database.objects(Task.self)
    return tasks
  }
  
  func updateTaskById(_ id: String, _ object: Task) {
    object.ID = id
    try! database.write {
      database.add(object, update: .modified)
    }
  }
  
  func getTaskById(_ id: String) -> Task {
    let predicate = NSPredicate(format: "ID = %@", id)
    let tasks = database.objects(Task.self).filter(predicate)
    return tasks[0]
  }
  
  func deleteTaskById(_ id: String) {
    let objectsToDelete = database.objects(Task.self).filter("ID = %@", id)
    try! database.write {
      database.delete(objectsToDelete)
    }
  }
}
