//
//  SecondViewController.swift
//  MemotyApp
//
//  Created by Martynov Evgeny on 22.03.21.
//

import UIKit

class SecondViewController: UIViewController {

    // lazy - ленивый
    // если не "?" -> то "unowned"
    private lazy var closure: (() -> ())? = { [weak self] in
        //guard let self = self else { return }
        self?.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //closure?()
        if let closure = closure {
            doSomthing(completionHandler: closure)
        }
        
        doSomthing { //[unowned self] in
            self.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } // при работе с методами VC все равно выгружается из памяти (важны только свойства)
        // замыкание разворачивается при помощи метода
    }

    @IBAction func closeVCPressed() {
        dismiss(animated: true)
    }

    // принимает параметр - замыкание
    private func doSomthing(completionHandler: () -> ()) {
        completionHandler()
    }

    deinit {
        print("deinit", SecondViewController.self)
    }
}
