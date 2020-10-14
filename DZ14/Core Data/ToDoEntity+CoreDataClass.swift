//
//  ToDoEntity+CoreDataClass.swift
//  
//
//  Created by Юлия Чужинова on 09.05.2020.
//
//

import Foundation
import CoreData

@objc(ToDoEntity)
public class ToDoEntity: NSManagedObject {
    convenience init() {
        // Описание сущности
        // Создание нового объекта
    self.init(entity: CoreDataManager.instance..entityForName("ToDoEntity"), insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
         }
    }
    
    
    
