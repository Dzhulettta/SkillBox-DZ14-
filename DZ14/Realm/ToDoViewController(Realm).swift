////
////  ToDoViewController.swift
////  DZ14
////
////  Created by Юлия Чужинова on 03.05.2020.
////  Copyright © 2020 Юлия Чужинова. All rights reserved.
////
//
//import UIKit
////import RealmSwift
//
//class ToDoViewController: UIViewController {
//    
//    var tabData = RealmManager.shared.readData()
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    //MARK:  - добавить ячейки (cоздание алерт контроллера для всплывающего окна)
//    
//    @IBAction func pushAddAction(_ sender: Any) { //кнопка добавить
//        
//        //MARK: - сохранить ячейки в Realm
//        
//        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert) // создание алерт контроллера
//        
//        alertController.addTextField { textField in
//            textField.placeholder = "New item name"
//        }
//        // создание кнопни закрыть и выйти
//        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
//        }
//        // создание кнопки для сохранения новых значений
//        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
//            let newItem = alertController.textFields![0].text // значение в текстовом поле
//            if let text = newItem { // проверяет не пустое ли поле
//                let task = TaskList()
//                task.task = text
//                let done = false
//                RealmManager.shared.addData(task: text, done: done)
//                self.reloadTable()    // Обновление таблицы
//            }
//        }
//        // добавление кнопок в алерт контроллер
//        alertController.addAction(alertAction1)
//        alertController.addAction(alertAction2)
//        present(alertController, animated: true, completion:  nil) // вызов алерт контроллера
//    }
//    //MARC: обновляет данные в realm и в таблице
//    private func reloadTable() {
//        tabData = RealmManager.shared.readData()
//        tableView.reloadData()
//    }
//    
//    //MARK: - изменить/удалить ячейки
//    
//    @IBAction func pushEditAction(_ sender: Any) {
//        tableView.setEditing(!tableView.isEditing, animated: true)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.tableView.reloadData()
//        }
//    }
//}
//
//extension ToDoViewController:  UITableViewDataSource, UITableViewDelegate {
//    
//    //MARK: - задает количество строк в таблице по числу элементов, сохраненных в realm
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tabData.count != 0 { // проверка массива на наличие элементов в нем
//            return tabData.count
//        }
//        return 0
//    }
//    
//    //MARK: - передает в ячейку задачу из realm
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Сell", for: indexPath)
//        
//        let task = tabData[indexPath.row]
//        cell.textLabel?.text = task.task
//        
//        if (task.done as? Bool) == true {
//            cell.imageView?.image = UIImage(named: "check")
//        } else {
//            cell.imageView?.image = UIImage(named: "checkin")
//        }
//        
//        if tableView.isEditing {
//            cell.textLabel?.alpha = 0.4
//            cell.imageView?.alpha = 0.4
//        } else {
//            cell.textLabel?.alpha = 1
//            cell.imageView?.alpha = 1
//        }
//        return cell
//    }
//    
//    //MARK: - удаляет cтроки
//    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        
//        let editingRow = tabData[indexPath.row] // обращение к ячейки, которую хотим удалить
//        
//        let deliteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
//            
//            RealmManager.shared.delData(editingRow: editingRow)
//            self.reloadTable()
//        }
//        return [deliteAction]
//    }
//    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    //MARK: - нажатие на ячейку и мзменение статуса
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        tableView.deselectRow(at: indexPath, animated: true) // анимация при нажатии на кнопку
//        
//        let task = tabData[indexPath.row] // берем выбранную ячейку
//        //        let done = !task.done
//        
//        RealmManager.shared.nowData(task: task.task, done: task.done)
//        
//        task.done = !task.done
////        self.reloadTable()
//        
//        tableView.reloadData() // обновляет таблицу
//    }
//}
