////
////  ToDoViewController(save).swift
////  DZ14
////
////  Created by Юлия Чужинова on 23.05.2020.
////  Copyright © 2020 Юлия Чужинова. All rights reserved.
////
//
//import Foundation
////
////  ToDoViewController.swift
////  DZ14
////
////  Created by Юлия Чужинова on 03.05.2020.
////  Copyright © 2020 Юлия Чужинова. All rights reserved.
////
//
//import UIKit
//
//class ToDoViewController: UIViewController {
//
//    var tabData = RealmManager.shared.readData()
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    //MARC - изменить/удалить ячейки
//    @IBAction func pushEditAction(_ sender: Any) {
//        tableView.setEditing(!tableView.isEditing, animated: true)
//        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//        //            self.tableView.reloadData()
//        //        }
//    }
//    //MARC:  добавить ячейки (cоздание флерт контроллера для всплывающего окна)
//    @IBAction func pushAddAction(_ sender: Any) {
//        //MARC - сохранить ячейки в Realm
//        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
//
//        alertController.addTextField { textField in
//            textField.placeholder = "New item name"
//        }
//        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
//        }
//        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
//            let newItem = alertController.textFields![0].text
//            if let text = newItem {
//                RealmManager.shared.addData(task: text, done: false)
//                self.reloadTable()    // Обновление таблицы
//            }
//        }
//        alertController.addAction(alertAction1)
//        alertController.addAction(alertAction2)
//        present(alertController, animated: true, completion:  nil)
//    }
//    //MARC: обновляет данные в realm и в таблице
//    private func reloadTable() {
//        tabData = RealmManager.shared.readData()
//        tableView.reloadData()
//    }
//}
//extension ToDoViewController:  UITableViewDataSource, UITableViewDelegate {
//
//    //MARC: задает количество строк в таблице по числу элементов, сохраненных в realm
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tabData.count
//    }
//
//    //MARC: передает в ячейку задачу из realm
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
//    //удаляет cтроки
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            RealmManager.shared.delData(task: "task", done: false)
//            self.reloadTable()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    //MARK: меняет статус задачи
//    //MARK: нажатие на ячейку
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        RealmManager.shared.delData(task: "task", done: false)
//        var task = tabData[indexPath.row]
//
//        task.done = !task.done
//        task.setValue(!(task.value(forKey: "done") as! Bool), forKey: "done")
//        if task.done {
//            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "check")
//        } else {
//            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "checkin")
//        }
//    }
//}
//
