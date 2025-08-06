//
//  TableViewCellViewModel.swift
//  MVVM2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import Foundation

protocol TableViewCellViewModelProtocol: class { // class - показывает нам для чего этот протокол
    var fullName: String { get }
    var age: String { get }
}

class TableViewCellViewModel: TableViewCellViewModelProtocol {

    private var profile: Profile

    var fullName: String {
        return profile.name + " " + profile.secondName
    }

    var age: String {
        return String(describing: profile.age)
    }

    init(profile: Profile) {
        self.profile = profile
    }
}
