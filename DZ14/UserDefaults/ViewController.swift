//
//  ViewController.swift
//  DZ14
//
//  Created by Юлия Чужинова on 03.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!

    @IBOutlet weak var saveButtonRad: UIButton!
    @IBAction func saveButton(_ sender: Any) {
    Persistance.shared.userName = nameTextField.text
    Persistance.shared.userFirstName = firstNameTextField.text

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButtonRad.layer.cornerRadius = 5
        nameTextField.text = Persistance.shared.userName
        firstNameTextField.text = Persistance.shared.userFirstName
}
}
