//
//  SecondViewController.swift
//  LifeCycleApp
//
//  Created by Martynov Evgeny on 17.02.21.
//

import UIKit

class SecondViewController: UIViewController {

    var someProperties: String! {
        didSet {
            print("SecondViewController: " + #function)
        }
    }
    
    @IBOutlet var openThirdVC: UIButton! {
        didSet {
            print("SecondViewController: " + #function + " IBOutlet")
        }
    }
    
    // Срабатывает после загрузки View
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController: " + #function)
    }
    
    // Срабатывает перед появленем вью на экране
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController: " + #function)
    }
    
    // Срабатывает перед тем, как размер вью поменяется под размер экрана
    override func viewWillLayoutSubviews() {
        print("SecondViewController: " + #function)
    }
    
    // Cрабатывает Auto Layout
    
    
    // Срабатывает после того, как размер вью изменился под размер экрана
    override func viewDidLayoutSubviews() {
        print("SecondViewController: " + #function)
    }
    
    // Срабатывает после появления вью на экране
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController: " + #function)
    }
    
    // Срабатывает при повороте экрана
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("SecondViewController: " + #function)
    }
    
    // Срабатывает перед тем, как вью закроется
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController: " + #function)
    }

    
    // Срабатывает после закрытия вью
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondViewController: " + #function)
    }
    
    deinit {
        print("SecondViewController: deinit")
    }
}
