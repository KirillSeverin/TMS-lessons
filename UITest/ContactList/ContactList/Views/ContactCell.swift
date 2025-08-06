//
//  ContactCell.swift
//  ContactList
//
//  Created by Martynov Evgeny on 5.04.21.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!

    func configure(with person: Person) {
        nameLabel.text = person.name
    }
}
