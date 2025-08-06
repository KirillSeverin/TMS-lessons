//
//  ContactListAppTests.swift
//  ContactListTests
//
//  Created by Martynov Evgeny on 7.04.21.
//

import XCTest
@testable import ContactList

class ContactListAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {

        super.tearDown()
    }

    // проверим то что InitialViewController -> это ContactListViewController
    func testInitialViewControllerIsContactListViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers.first // первый контроллер

        XCTAssertTrue(rootViewController is ContactListViewController)
    }
}
