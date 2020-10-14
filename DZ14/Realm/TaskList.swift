//
//  TaskList.swift
//  DZ14
//
//  Created by Юлия Чужинова on 16.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation
import RealmSwift

class TaskList: Object{
    @objc dynamic var task = ""
    @objc dynamic var done = false
  }
