//
//  ViewModel.swift
//  MVVM1
//
//  Created by Martynov Evgeny on 18.04.21.
//

import Foundation

class ViewModel {

    private var profile = Profile(name: "Kolya", surname: "Ivanov", age: 18)

    var name: String {
        return profile.name
    }

    var surname: String {
        return profile.surname
    }

    var age: String {
        return String(describing: profile.age)
    }
}
