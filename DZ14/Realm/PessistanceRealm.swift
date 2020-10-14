//
//  PessistanceRealm.swift
//  DZ14
//
//  Created by Юлия Чужинова on 06.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//
//
//import Foundation
//import RealmSwift
//
//@objcMembers
//class TaskList: Object{
//    dynamic var name = ""
//    dynamic var isCompl = false
//   
//}
//
//protocol PessistanceProtocol {
//    func saveItems(task: TaskList)
//    func obtainTasks() -> [TaskList]
//}
//
//class PessistanceRealm: PessistanceProtocol {
//    
//    fileprivate lazy var mainRealm = try! Realm(configuration: .defaultConfiguration)
//    
//    func saveItems(task: TaskList){
//       try! mainRealm .write {
//        mainRealm .add(task)
//        }
//    }
//    func obtainTasks() -> [TaskList] {
//
//        let models = mainRealm.objects(TaskList.self)
//        return Array(models)
//    }
//    }



//
//class PessistanceRealm{
//    static let shared = PessistanceRealm()
//
//    private let realm = try! Realm()
//
//    func  test(){
//        let itemToDo = AllItems()
//        itemToDo.allItemsToDo = [[AllItems]]
//        try! realm.write {
//            realm.add(itemToDo)
//        }
//        let allDogs = realm.objects(AllItems.self)
//        for dog in allDogs{
//            print("--" + dog.name)
//        }
//    }
//}

//class Dog: Object{
//    @objc dynamic var name = ""
//}
//
//class PessistanceRealm{
//    static let shared = PessistanceRealm()
//
//    private let realm = try! Realm()
//
//    func  test(){
//        let dog = Dog()
//        dog.name = "Marta"
//        try! realm.write {
//            realm.add(dog)
//        }
//        let allDogs = realm.objects(Dog.self)
//        for dog in allDogs{
//            print("--" + dog.name)
//        }
//    }
//}
