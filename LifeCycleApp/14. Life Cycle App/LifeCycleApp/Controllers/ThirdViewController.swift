//
//  ThirdViewController.swift
//  LifeCycleApp
//
//  Created by Martynov Evgeny on 17.02.21.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ThirdViewController: " + #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ThirdViewController: " + #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ThirdViewController: " + #function)
    }
    
    // Срабатывает перед тем, как вью закроется
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ThirdViewController: " + #function)
    }
    
    // Срабатывает после закрытия вью
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ThirdViewController: " + #function)
    }

    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // Выгружает объект из памяти
    deinit {
        print("ThirdViewController: " + #function)
    }
}
