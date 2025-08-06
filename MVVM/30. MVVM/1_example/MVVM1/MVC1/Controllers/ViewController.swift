//
//  ViewController.swift
//  MVC1
//
//  Created by Martynov Evgeny on 18.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

//    var profile: Profile? {
//        didSet {
//            guard let profile = profile else { return }
//
//            self.nameLabel.text = profile.name
//            self.surnameLabel.text = profile.surname
//            self.ageLabel.text = "\(profile.age)"
//        }
//    }

    var viewModel: ViewModel! {
        didSet {
            self.nameLabel.text = viewModel.name
            self.surnameLabel.text = viewModel.surname
            self.ageLabel.text = viewModel.age
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //profile = Profile(name: "Kolya", secondName: "Ivanov", age: 18)
        viewModel = ViewModel()
    }
}


