//
//  ToDoEntity+CoreDataProperties.swift
//  
//
//  Created by Юлия Чужинова on 09.05.2020.
//
//

import Foundation
import CoreData


extension ToDoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoEntity> {
        return NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
    }

    @NSManaged public var toDoIsCompleted: Bool
    @NSManaged public var toDoName: String?

}

//// MARK: Generated accessors for users
//extension Book {
//
//    @objc(addUsersObject:)
//    @NSManaged public func addToUsers(_ value: User)
//
//    @objc(removeUsersObject:)
//    @NSManaged public func removeFromUsers(_ value: User)
//
//    @objc(addUsers:)
//    @NSManaged public func addToUsers(_ values: NSSet)
//
//    @objc(removeUsers:)
//    @NSManaged public func removeFromUsers(_ values: NSSet)
//
//}
