//
//  ViewController.swift
//  SRP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import UIKit

class ViewController: UIViewController {

    let dataFetcherService = DataFetcherService()
    let dataStore = DataStore.shared
    let validateService = ValidateService.shared

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        saveButton.layer.cornerRadius = saveButton.frame.width / 2

        dataFetcherService.fetchCountry { (countries) in
            print(countries?.first?.Name)
        }
        
        dataFetcherService.fetchFreeGames { (freeGames) in
            print(freeGames?.feed.results.first?.name)
        }
        
        dataFetcherService.fetchNewGames { (newGames) in
            print(newGames?.feed.results.first?.name)
        }
    }

    // MARK: - Business logic

    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        dataStore.saveName(name: name)
    }

    //MARK: - User interface

    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Your name can't be empty.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func changeLabel(_ sender: Any) {
        if let email = myTextField.text,
            validateService.isValidEmail(email) {
            textLabel.text = "Coool!!!"
            saveButton.isEnabled = true
        } else {
            textLabel.text = "Bad email"
            saveButton.isEnabled = false
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }
}

