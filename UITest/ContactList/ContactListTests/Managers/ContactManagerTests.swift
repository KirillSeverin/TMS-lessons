//
//  ContactManagerTests.swift
//  ContactListTests
//
//  Created by Martynov Evgeny on 5.04.21.
//

import XCTest
@testable import ContactList

class ContactManagerTests: XCTestCase {

    var contactManager: ContactManager!
    var person: Person!

    override func setUp() {
        super .setUp()
        print("- - - setUp - - -")
        contactManager = ContactManager() // contactManager init
        person = Person(name: "name", phone: "phone")
    }

    override func tearDown() {
        print("- - - tearDown - - -")
        contactManager = nil // contactManager deinit
        person = nil
        super.tearDown()
    }

    // проверка пустого contactManager после инициализации
    func testInitContactManagerWithEmptyList() {
        print("1")
        XCTAssertEqual(contactManager.contactsCount, 0)
    }

    // проверка добавления нового контакта
    func testAddPersonIncrementContactListCount() {
        print("2")
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }

    // контакт по индексу добавлен
    func testContactAtIndexIsAddedPerson() {
        print("3")
        contactManager.add(person: person)
        let returnedPerson = contactManager.person(at: 0)
        XCTAssertEqual(person, returnedPerson)
    }

    // делаем список только уникальных контактов
    func testAddingSameObjectDoesNotIncrementCount() {
        print("4")
        contactManager.add(person: Person(name: "name", phone: "phone"))
        contactManager.add(person: Person(name: "name", phone: "phone"))
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
}
