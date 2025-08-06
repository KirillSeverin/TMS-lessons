//
//  NewContactViewController.swift
//  ContactList
//
//  Created by Martynov Evgeny on 7.04.21.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!

    // передаем contactManager в NewContactViewController
    var contactManager: ContactManager!

    @IBAction func saveButtonPressed() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let phone = phoneTextField.text

        let imageData = #imageLiteral(resourceName: "avatar").pngData()
        let person = Person(
            name: name ?? "",
            surname: surname ?? "",
            phone: phone ?? "",
            imageData: imageData
        )

        contactManager.add(person: person)
        dismiss(animated: true)
    }

    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}
