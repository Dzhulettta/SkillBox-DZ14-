////
////  RealmManager.swift
////  DZ14
////
////  Created by Юлия Чужинова on 16.05.2020.
////  Copyright © 2020 Юлия Чужинова. All rights reserved.
////
//import UIKit
//import Foundation
//import RealmSwift
//
//class RealmManager {
//    
//    static let shared = RealmManager()
//    let realm = try! Realm() // доступ к хранилищу
//    
//    func readData() -> Results<TaskList> { //контейнер со свойствами объекта TaskList
//        
//        return realm.objects(TaskList.self) // из базы выбираем все объекты типа realm
//    }
//    
//    //добавляет строки в realm
//    func addData(task: String, done: Bool) {
//        let taskObj = TaskList()
//        taskObj.task = "\(task)"
//        taskObj.done = done
//        
//        try! realm.write {
//            realm.add(taskObj)
//        }
//    }
//    
//    //удаляет строки из realm
//    func delData(editingRow: Any) {
//        try! self.realm.write {
//            self.realm.delete(editingRow as! Object)
//                   }
//        }
//        
//    //обновляет строку из realm
//    func nowData(task: String, done: Bool) {
//        
//        let taskObj = TaskList()
//        try! self.realm.write({ () -> Void in
//            taskObj.done = !taskObj.done             // меняет статус задачи на противоположный
//        })
//        
//    }
//}
