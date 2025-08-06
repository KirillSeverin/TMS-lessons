//
//  UserCell.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 24.02.21.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var usernameLbl: UILabel!

    func configure(with user: User) {
        nameLbl.text = user.name
        usernameLbl.text = user.username
    }
}
