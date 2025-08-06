//
//  LoginViewController.swift
//  FirebaseToDoCW
//
//  Created by Martynov Evgeny on 12.04.21.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {

    private var ref: DatabaseReference!

    @IBOutlet private weak var warnLabel: UILabel!
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference(withPath: "users")

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)

        // если у нас еще есть действующий user то сделаем переход
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let _ = user else { return }
            self?.performSegue(withIdentifier: Constants.Segues.tasks, sender: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // чистим поля
        emailTF.text = ""
        passwordTF.text = ""
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        // проверяем все поля
        guard let email = emailTF.text,
              let password = passwordTF.text,
              email != "", password != "" else {
            // показываем уникальный error
            displayWarningLabel(withText: "info is incorrect")
            return
        }

        // логинемся
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            if let _ = error {
                self?.displayWarningLabel(withText: "Error ocured")
            } else if let _ = user {
                // переходим на новый экран
                self?.performSegue(withIdentifier: Constants.Segues.tasks, sender: nil)
                return
            } else {
                self?.displayWarningLabel(withText: "No such user")
            }
        }
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        // проверяем все поля
        guard let email = emailTF.text, let password = passwordTF.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }

        // createUser
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            guard error == nil, user != nil else {
                self?.displayWarningLabel(withText: "Registration was incorrect")
                print(error!.localizedDescription)
                return
            }

            guard let user = user else { return }
            let userRef = self?.ref.child(user.user.uid)
            userRef?.setValue(["email": user.user.email])
        }
    }

    private func displayWarningLabel(withText text: String) {
        warnLabel.text = text
        // curveEaseInOut - плавно появляется и плавно исчезает
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in self?.warnLabel.alpha = 1 }) { [weak self] complete in
            self?.warnLabel.alpha = 0 }
    }

    @objc func keyboardDidShow (notification: Notification) {
        guard let userInfo = notification.userInfo, let scrollView = view as? UIScrollView else { return }
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + kbFrameSize.height)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
    }

    @objc func keyboardDidHide () {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
    }
}
