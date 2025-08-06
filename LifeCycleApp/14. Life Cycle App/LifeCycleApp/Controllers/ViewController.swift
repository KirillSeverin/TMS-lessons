//
//  ViewController.swift
//  LifeCycleApp
//
//  Created by Martynov Evgeny on 17.02.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: " + #function)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToSecondVC" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.someProperties = "someProperties"
        }
    }
}

