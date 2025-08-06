//
//  DetailViewController.swift
//  ContactList
//
//  Created by Martynov Evgeny on 7.04.21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    // при переходе пердаем person в этот VC
    var person: Person!

//    override func viewDidLoad() {
//
//        if let imageData = person.imageData,
//            let image = UIImage(data: imageData) {
//
//            nameLabel.text = person.name
//            surnameLabel.text = person.surname
//            phoneLabel.text = person.phone
//            imageView.image = image
//        }
//    }

    override func viewWillAppear(_ animated: Bool) {
        if let imageData = person.imageData,
            let image = UIImage(data: imageData) {

            nameLabel.text = person.name
            surnameLabel.text = person.surname
            phoneLabel.text = person.phone
            imageView.image = image
        }
    }
}
