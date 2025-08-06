//
//  ViewController.swift
//  SRP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import UIKit

class ViewController: UIViewController {

    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"

    let networkService = NetworkService.shared
    let dataStore = DataStore.shared
    let validateService = ValidateService.shared

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        //dataFetcher(pathUrlString: urlString)
        networkService.dataFetcher(urlString: urlString)
    }

    // MARK: - Business logic

    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        //saveName(name: name)
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
            //isValidEmail(email) {
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

//    //MARK: - NetworkService
//
//    private func dataFetcher(pathUrlString: String) {
//        request(urlString: urlString) { (data, error) in
//            let decoder = JSONDecoder()
//            guard let data = data else { return }
//            let response = try? decoder.decode([Country].self, from: data)
//            print(response ?? "")
//        }
//    }
//
//    private func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
//        guard let url = URL(string: urlString) else { return }
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            DispatchQueue.main.async {
//                completion(data, error)
//            }
//        }
//        task.resume()
//    }
//
//    //MARK: - DataStore
//
//    private func saveName(name: String) {
//        print("Your name: \(name) is saved")
//    }
//
//    private func getName() -> String {
//        return "some name"
//    }
//
//    //MARK: - ValidateService
//
//    private func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
//        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
}

