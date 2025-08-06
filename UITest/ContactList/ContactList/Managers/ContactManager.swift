//
//  ContactManager.swift
//  ContactList
//
//  Created by Martynov Evgeny on 5.04.21.
//

import Foundation

class ContactManager {

    private var persons: [Person] = []

    var contactsCount: Int {
        return persons.count
    }

    func add(person: Person) {
        if !persons.contains(person) {
            persons.append(person)
        }
    }

    func person(at index: Int) -> Person {
        return persons[index]
    }
    
    func personsGet() -> [Person] {
        return persons
    }
}


