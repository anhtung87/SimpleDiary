//
//  TaskModel.swift
//  SimpleDiary
//
//  Created by Hoang Tung on 4/23/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
  @objc dynamic var ID = ""
  @objc dynamic var name = ""
  @objc dynamic var startTime = ""
  @objc dynamic var time = ""
  
  override class func primaryKey() -> String? {
    return "ID"
  }
}
