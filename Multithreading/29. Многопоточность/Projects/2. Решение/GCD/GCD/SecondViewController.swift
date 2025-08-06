//
//  SecondViewController.swift
//  GCD
//
//  Created by Martynov Evgeny on 13.04.21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImage()

        delay(3) {
            self.loginAlert()
        }
    }

    private func fetchImage() {
        
        let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        // создаем очередь (utility - Служебные задачи имеют более низкий приоритет, чем стандартные, инициируемые пользователем и интерактивные задачи, но более высокий приоритет, чем фоновые задачи. Назначьте этот класс качества обслуживания задачам, которые не мешают пользователю продолжать использовать ваше приложение. Например, вы можете назначить этот класс длительным задачам, за ходом выполнения которых пользователь не следит активно.)
        // global - Возвращает глобальную системную очередь с заданным классом качества обслуживания.
        let queue = DispatchQueue.global(qos: .utility)
        // добавляем процесс асинхронно в другой поток
        queue.async {
            guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }

    private func delay(_ delay: Int, closure: @escaping () -> ()) {
        // создаем задержку на delay секунд с помощью asyncAfter
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }

    private func loginAlert() {
        let ac = UIAlertController(title: "Зарегистрированы?", message: "Введите ваш логин и пароль", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)

        ac.addAction(okAction)
        ac.addAction(cancelAction)

        ac.addTextField { (usernameTF) in
            usernameTF.placeholder = "Введите логин"
        }

        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Введите пароль"
            userPasswordTF.isSecureTextEntry = true
        }

        self.present(ac, animated: true, completion: nil)
    }
}
