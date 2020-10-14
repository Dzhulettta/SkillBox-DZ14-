//
//  ToDoViewController.swift
//  DZ14
//
//  Created by Юлия Чужинова on 03.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoViewController: UIViewController {

    let realm = try! Realm() // доступ к хранилищу
    @IBOutlet weak var tableView: UITableView!
    var tabData: Results<TaskList>!  //контейнер со свойствами объекта TaskList

    override func viewDidLoad() {
        super.viewDidLoad()
        tabData = realm.objects(TaskList.self)
    }

    //MARK:  - добавить ячейки (cоздание флерт контроллера для всплывающего окна)

    @IBAction func pushAddAction(_ sender: Any) { //кнопка добавить

        //MARK: - сохранить ячейки в Realm

        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert) // создание алерт контроллера

        alertController.addTextField { textField in
            textField.placeholder = "New item name"
        }
        // создание кнопни закрыть и выйти
        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
        }
        // создание кнопки для сохранения новых значений
        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
            let newItem = alertController.textFields![0].text // значение в текстовом поле
            if let text = newItem { // проверяет не пустое ли поле

                let task = TaskList() // создание экземпляра модели
                task.task = text // присваивает текст из алерт контроллера текст данному экземпляру
                task.done = false // можно и не задавать, так как по умолчанию он уже стоит

                try! self.realm.write {
                    self.realm.add(task) // добавление задачи в массив TaskList
                }

               // self.tabData.append(text) // добавление нового элемента в массив задач
                self.tableView.insertRows(at: [IndexPath.init(row: self.tabData.count-1, section: 0)], with: .automatic) // обновление таблицы
            }
        }
        // добавление кнопок в алерт контроллер
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion:  nil) // вызов алерт контроллера
    }

    //MARK: - изменить/удалить ячейки

    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        //            self.tableView.reloadData()
        //        }
    }
}

extension ToDoViewController:  UITableViewDataSource, UITableViewDelegate {

    //MARK: - задает количество строк в таблице по числу элементов, сохраненных в realm

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tabData.count != 0 { // проверка массива на наличие элементов в нем
            return tabData.count
        }
        return 0
    }

    //MARK: - передает в ячейку задачу из realm

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Сell", for: indexPath)

        let task = tabData[indexPath.row]
        cell.textLabel?.text = task.task

        if (task.done as? Bool) == true {
            cell.imageView?.image = UIImage(named: "check")
        } else {
            cell.imageView?.image = UIImage(named: "checkin")
        }
        return cell
    }

    //MARK: - удаляет cтроки

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let editingRow = tabData[indexPath.row] // обращение к ячейки, которую хотим удалить

        let deliteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in

            try! self.realm.write {
                self.realm.delete(editingRow)
                    tableView.reloadData()
            }
        }
        return [deliteAction]
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //MARK: - нажатие на ячейку и мзменение статуса

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true) // анимация при нажатии на кнопку

        let task = tabData[indexPath.row] // берем выбранную ячейку

        try! self.realm.write({ () -> Void in

            task.done = !task.done // меняет статус задачи на противоположный
            tableView.reloadData() // обновляет таблицу
        })
    }
}
