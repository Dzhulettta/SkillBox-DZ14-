//
//  ToDoListViewControllerCoreData.swift
//  DZ14
//
//  Created by Юлия Чужинова on 10.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewControllerCoreData: UIViewController {
    
    var tasks: [NSManagedObject] = []    //создание экземпляра базы данных
    
    @IBOutlet weak var tableView2: UITableView!
    
   @IBAction func pushAddAction(_ sender: Any) {
         saveData()
         tableView2.reloadData()
     }
    
    @IBAction func pushEditAction(_ sender: Any) {
        tableView2.setEditing(!tableView2.isEditing, animated: true)
    }
 
  override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView2.delegate = self
        self.tableView2.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // вызов базы
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoEntity")
        do {
            tasks = try! context.fetch(fetchRequest) as? [NSManagedObject] ?? [NSManagedObject]()
        }
    }
    
    //MARK: - сохранение изменений в базе
    
    func changeToCoreDate (item: String, done: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "ToDoEntity", in: context) else { return }
        
        do {
            try! context.save()
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
         tableView2.reloadData()
    }
    
    //MARK: - добление новых ячеек в базе
    
    func addToCoreDate (item: String, done: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "ToDoEntity", in: context) else { return }
        
        let taskToAdd = NSManagedObject.init(entity: entity, insertInto: context)
        taskToAdd.setValue(item, forKey: "task")
        
        taskToAdd.setValue(done, forKey: "done")
        tableView2.reloadData()
        
        do {
            try! context.save()
            tasks.append(taskToAdd)
            
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    //MARK: - удаление ячейки в базе
       
       func deleteData(index: Int) {
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
           let context = appDelegate.persistentContainer.viewContext
           let toDo = tasks[index]
           
           do {
               try! context.delete(toDo)
               tableView2.reloadData()
           }
       }
    
     //MARK: - добавление новой ячейки в таблицу (cоздание флерт контроллера для всплывающего окна)
    
    func saveData() {

        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "New item name"
        }
        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
        }
        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
            
            guard let newItem = alertController.textFields?.last?.text else { return }
            let done = false
            self.addToCoreDate(item: newItem, done: done)
            self.tableView2.reloadData()
        }
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion:  nil)
    }
}

extension ToDoViewControllerCoreData: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //MARK: - заполнение ячейки данными
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView2.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = task.value(forKey: "task") as! String
        
        if (task.value(forKey: "done") as? Bool) == false {
            cell.imageView?.image = UIImage(named: "checkin")
        } else {
            cell.imageView?.image = UIImage(named: "check")
        }
        return cell
    }
    
    //MARK: - анимация при нажатии на ячейку
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //MARK: - нажатие на ячейку и изменение статуса
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let task = tasks[indexPath.row]
        var done = false
        let taskTheSame = task.value(forKey: "task") as! String
        if task == task {
            
            task.setValue(!(task.value(forKey: "done") as! Bool), forKey: "done")
            
            if task.value (forKey: "done") as? Bool == false {
                tableView2.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "checkin")
                done = false
                
            } else {
                tableView2.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "check")
                done = true
            }
        }
        changeToCoreDate(item: taskTheSame, done: done)
        tableView2.deselectRow(at: indexPath, animated: true)
    }
    
      //MARK: - удаление ячейки из таблицы
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            deleteData(index: indexPath.row)
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView2.reloadData()
        }
        tableView2.reloadData()
    }
}

