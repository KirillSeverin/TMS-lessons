//
//  ViewController.swift
//  Singleton
//
//  Created by Martynov Evgeny on 22.04.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let safe = Safe.shared
        print(safe.someData)
    }
}

