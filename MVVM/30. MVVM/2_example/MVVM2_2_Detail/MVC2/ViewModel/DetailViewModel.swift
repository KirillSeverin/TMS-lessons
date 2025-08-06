//
//  DetailViewModel.swift
//  MVVM2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import Foundation

protocol DetailViewModelProtocol {
    var description: String { get }
    var age: Box<String?> { get }
}

class DetailViewModel: DetailViewModelProtocol {

    private var profile: Profile

    var description: String {
        return String(describing: "Name: \(profile.name)\n\nSecondName: \(profile.secondName)\n\nAge: \(profile.age)")
    }

    var age: Box<String?> = Box(nil)

    init(profile: Profile) {
        self.profile = profile
    }
}
